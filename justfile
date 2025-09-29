# Set shell to PowerShell on Windows
set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

# Default recipe to list available commands
default:
    @just --list

# Render all WHR-report-analysis notebooks
render-all:
    @echo "🚀 Starting to render all WHR notebooks..."
    @echo "[1/6]"
    @just render main
    @echo "[2/6]"
    @just render 1
    @echo "[3/6]"
    @just render 2
    @echo "[4/6]"
    @just render 3
    @echo "[5/6]"
    @just render 4
    @echo "[6/6]"
    @just render 5
    @echo "✅ All notebooks rendered successfully!"

# Publish all WHR-report-analysis notebooks
publish-all:
    @echo "📤 Starting to publish all WHR notebooks..."
    @echo "[1/6]"
    @just publish main
    @echo "[2/6]"
    @just publish 1
    @echo "[3/6]"
    @just publish 2
    @echo "[4/6]"
    @just publish 3
    @echo "[5/6]"
    @just publish 4
    @echo "[6/6]"
    @just publish 5
    @echo "✅ All notebooks published successfully!"

# Render and publish all notebooks
all:
    @echo "🔄 Running full workflow: render + publish"
    @just render-all
    @echo ""
    @just publish-all

# Render a specific notebook (pass number as argument, or 'main' for the base file)
render NUMBER:
    @echo "🚀 Rendering notebook: {{NUMBER}}"
    {{ if NUMBER == "main" { "just _render-main" } else if NUMBER == "5" { "just _render-branded" } else { "just _render-numbered " + NUMBER } }}
    @echo "✅ Render completed!"

# Internal helper for rendering
[private]
_render-main:
    @Write-Host "📄 Rendering WHR-report-analysis.ipynb" -ForegroundColor Cyan
    @uv run quarto render WHR-report-analysis.ipynb --execute

[private]
_render-branded:
    @Write-Host "📄 Rendering branded/WHR-report-analysis-5.ipynb" -ForegroundColor Cyan
    @uv run quarto render branded/WHR-report-analysis-5.ipynb --execute

[private]
_render-numbered NUMBER:
    @Write-Host "📄 Rendering WHR-report-analysis-{{NUMBER}}.ipynb" -ForegroundColor Cyan
    @uv run quarto render WHR-report-analysis-{{NUMBER}}.ipynb --execute

# Publish a specific notebook (pass number as argument, or 'main' for the base file)
publish NUMBER:
    @echo "📤 Publishing notebook: {{NUMBER}}"
    {{ if NUMBER == "main" { "just _publish-main" } else if NUMBER == "5" { "just _publish-branded" } else { "just _publish-numbered " + NUMBER } }}
    @echo "✅ Publish completed!"

# Internal helpers for publishing
[private]
_publish-main:
    @Write-Host "📄 Publishing WHR-report-analysis.ipynb" -ForegroundColor Green
    @uv run quarto publish WHR-report-analysis.ipynb

[private]
_publish-branded:
    @Write-Host "📄 Publishing branded/WHR-report-analysis-5.ipynb" -ForegroundColor Green
    @pushd branded; uv run quarto publish WHR-report-analysis-5.ipynb; popd

[private]
_publish-numbered NUMBER:
    @Write-Host "📄 Publishing WHR-report-analysis-{{NUMBER}}.ipynb" -ForegroundColor Green
    @uv run quarto publish WHR-report-analysis-{{NUMBER}}.ipynb

# Render and publish a specific notebook
process NUMBER:
    @echo "🔄 Processing notebook: {{NUMBER}} (render + publish)"
    @just render {{NUMBER}}
    @echo ""
    @just publish {{NUMBER}}

# Clean all generated outputs
clean:
    @echo "🧹 Cleaning generated outputs..."
    @if (Test-Path _site) { Write-Host "  Removing _site directory" -ForegroundColor Yellow; Remove-Item -Recurse -Force _site }
    @if (Test-Path *_files) { Write-Host "  Removing *_files directories" -ForegroundColor Yellow; Remove-Item -Recurse -Force *_files }
    @if (Test-Path branded/*_files) { Write-Host "  Removing branded/*_files directories" -ForegroundColor Yellow; Remove-Item -Recurse -Force branded/*_files }
    @Write-Host "  Removing all HTML files" -ForegroundColor Yellow
    @Get-ChildItem -Filter *.html -Recurse | Remove-Item -Force
    @echo "✅ Clean completed!"

# List all WHR notebooks
list:
    @echo "📋 WHR Report Analysis Notebooks:"
    @echo "  - WHR-report-analysis.ipynb (main)"
    @echo "  - WHR-report-analysis-1.ipynb"
    @echo "  - WHR-report-analysis-2.ipynb"
    @echo "  - WHR-report-analysis-3.ipynb"
    @echo "  - WHR-report-analysis-4.ipynb"
    @echo "  - branded/WHR-report-analysis-5.ipynb"
    @echo ""
    @echo "💡 Usage: just render <number> or just render main"
    @echo "💡 Usage: just publish <number> or just publish main"
    @echo "💡 Usage: just process <number> or just process main"
    @echo "💡 Usage: just render-all, just publish-all, just all"