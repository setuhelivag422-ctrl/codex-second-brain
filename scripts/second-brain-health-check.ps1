param(
  [string] $Root = "."
)

$ErrorActionPreference = "Stop"

# 中文:公开版第二大脑只读健康检查; English: Read-only health check for the public second brain skeleton.
$rootPath = Resolve-Path -LiteralPath $Root
$manifestPath = Join-Path $rootPath "manifest.json"
$exampleManifestPath = Join-Path $rootPath "manifest.example.json"
$indexPath = Join-Path $rootPath "index.md"

$errors = New-Object System.Collections.Generic.List[string]
$warnings = New-Object System.Collections.Generic.List[string]

function Add-ErrorMessage {
  param([string] $Message)
  $errors.Add($Message) | Out-Null
}

function Add-WarningMessage {
  param([string] $Message)
  $warnings.Add($Message) | Out-Null
}

$selectedManifestPath = $manifestPath
if (-not (Test-Path -LiteralPath $selectedManifestPath)) {
  $selectedManifestPath = $exampleManifestPath
}

if (-not (Test-Path -LiteralPath $selectedManifestPath)) {
  Add-ErrorMessage "manifest.json 或 manifest.example.json 不存在 / No manifest file found"
} else {
  try {
    $manifest = Get-Content -LiteralPath $selectedManifestPath -Raw -Encoding UTF8 | ConvertFrom-Json
  } catch {
    Add-ErrorMessage "manifest 解析失败 / Failed to parse manifest: $($_.Exception.Message)"
  }
}

if (-not (Test-Path -LiteralPath $indexPath)) {
  Add-ErrorMessage "index.md 不存在 / index.md is missing"
} else {
  $indexText = Get-Content -LiteralPath $indexPath -Raw -Encoding UTF8
}

if ($manifest) {
  $seenIds = @{}
  foreach ($entry in $manifest.entries) {
    if (-not $entry.id) {
      Add-ErrorMessage "存在缺少 id 的条目 / Entry missing id"
      continue
    }

    if ($seenIds.ContainsKey($entry.id)) {
      Add-ErrorMessage "重复 id / Duplicate id: $($entry.id)"
    } else {
      $seenIds[$entry.id] = $true
    }

    if ($entry.path) {
      $entryPath = Join-Path $rootPath $entry.path
      if (-not (Test-Path -LiteralPath $entryPath)) {
        Add-WarningMessage "manifest path 不存在 / Missing manifest path: $($entry.path)"
      }
    }
  }
}

$result = [ordered] @{
  ok = ($errors.Count -eq 0)
  root = [string] $rootPath
  checked_at = (Get-Date).ToString("s")
  errors = @($errors)
  warnings = @($warnings)
}

$result | ConvertTo-Json -Depth 5

if ($errors.Count -gt 0) {
  exit 1
}
