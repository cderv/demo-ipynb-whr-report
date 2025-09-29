# World Happiness Report Analysis with Jupyter and Quarto

This repository demonstrates how to create professional data analysis reports using Jupyter notebooks and publish them with Quarto. It showcases the evolution from a basic notebook to a fully branded, publication-ready report.

This is a companion demo to the [PyData Paris 2025 Quarto Publish presentation](https://github.com/cderv/pydata-paris-2025-quarto-publish).

Based on workshop materials from the [Posit Conf Quarto workshop](https://github.com/posit-dev/quarto-brand-exercises).

## 📊 Project Overview

This project analyzes the World Happiness Report data from 2011-2024, exploring global happiness trends and the factors that contribute to national happiness levels across 169 countries.

## 📂 Project Structure

```
demo-ipynb-whr-report/
├── WHR-report-analysis.ipynb       # Base report with Quarto YAML front matter
├── WHR-report-analysis-1.ipynb     # Version 1: Basic Python notebook
├── WHR-report-analysis-2.ipynb     # Version 2: Added table formatting
├── WHR-report-analysis-3.ipynb     # Version 3: Enhanced visualizations
├── WHR-report-analysis-4.ipynb     # Version 4: Multiple output formats
├── branded/
│   └── WHR-report-analysis-5.ipynb # Version 5: Fully branded with logo
├── data/
│   └── whr.csv                     # World Happiness Report dataset
└── _publish.yml                    # Quarto publishing configuration
```

## 🚀 Getting Started

### Prerequisites

- Python 3.8+
- [uv](https://github.com/astral-sh/uv) (Python package manager)
- [Quarto](https://quarto.org/) (for rendering and publishing)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/demo-ipynb-whr-report.git
cd demo-ipynb-whr-report
```

2. Restore the Python environment using uv:
```bash
uv sync
```

This will install all required dependencies (polars, plotnine, great_tables, numpy) in an isolated environment.

## 📝 Usage

### Render Notebooks with Quarto

To render an executed notebook to HTML:
```bash
quarto render WHR-report-analysis-1.ipynb
```
or with execution:
```bash
quarto render WHR-report-analysis-1.ipynb --execute
```

To render the branded version:
```bash
quarto render branded/WHR-report-analysis-5.ipynb --execute
```

### Publish to Quarto Pub

To publish a notebook to Quarto Pub:
```bash
quarto publish quarto-pub WHR-report-analysis-1.ipynb
```

## 🔗 Published Examples

View the published reports online:
- https://cderv-posit.quarto.pub/whr-report-analysis
- https://cderv-posit.quarto.pub/whr-report-analysis-1
- https://cderv-posit.quarto.pub/whr-report-analysis-2
- https://cderv-posit.quarto.pub/whr-report-analysis-3
- https://cderv-posit.quarto.pub/whr-report-analysis-4
- https://cderv-posit.quarto.pub/whr-report-analysis-5

## 📄 License

This project is for demonstration purposes. The World Happiness Report data is publicly available.

## 🤝 Acknowledgments

- [Posit](https://posit.co/) for Quarto and workshop materials
- [World Happiness Report](https://worldhappiness.report/) for the dataset