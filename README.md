# World Happiness Report 2024: Applied Regression Analysis

An academic applied-regression project using SAS to examine associations between national happiness scores and selected well-being indicators in the **World Happiness Report 2024**.

## Research question

How are a country's healthy life expectancy, freedom to make life choices, generosity, and perceptions of corruption associated with its overall happiness score?

## Data

- **Observational unit:** Country
- **Sample size:** 140 countries
- **Response:** Ladder score, a national average of respondents' self-rated life satisfaction on a 0–10 scale
- **Candidate predictors:** Healthy life expectancy contribution, freedom contribution, generosity contribution, and perceptions-of-corruption contribution
- **Source:** [World Happiness Report 2024 dataset on Kaggle](https://www.kaggle.com/datasets/jainaru/world-happiness-report-2024-yearly-updated/data). The project used the dataset indirectly through Kaggle.

The CSV is not included in this repository. Download the dataset from the source above and update the file path in `code/happiness_regression.sas` before running the program.

## Methods

1. Explored relationships between each candidate predictor and the happiness score using scatterplots and fitted regression lines.
2. Fit an initial multiple linear regression model with all four predictors.
3. Evaluated multicollinearity using variance inflation factors (VIF) and assessed model assumptions using residual plots and a normal Q–Q plot.
4. Examined unusual and potentially influential observations using studentized residuals and Cook's distance.
5. Compared forward selection, backward elimination, and stepwise selection.
6. Fit and interpreted a reduced model containing healthy life expectancy and freedom.

## Main findings

All three variable-selection procedures retained **healthy life expectancy** and **freedom**, while removing generosity and perceptions of corruption at the 0.05 significance level.

The final fitted model was:

Ladder Score = 1.476 + 4.278(Healthy Life Expectancy) + 2.943(Freedom)

- Both retained predictors had statistically significant positive associations with the happiness score (**p < 0.0001**).
- The reduced model had **R² = 0.7147** and **adjusted R² = 0.7105**, explaining approximately 71.5% of the observed variation in country-level happiness scores.
- The 95% confidence interval was **(3.57222, 4.98347)** for the healthy-life-expectancy coefficient and **(2.22728, 3.65963)** for the freedom coefficient.

## Important interpretation note

The predictor variables are calculated contributions used in the World Happiness Report's score decomposition, rather than direct measurements of actual life expectancy and freedom. Their relationships with the ladder score are therefore partly built into the scoring methodology. These results describe associations in this dataset; they should not be interpreted as evidence that the underlying factors independently cause greater happiness.

## Repository contents

```text
world-happiness-regression/
├── README.md
├── code/
│   └── happiness_regression.sas
└── report/
    └── project_report.pdf
```

## How to run

1. Download the CSV dataset from the Kaggle source linked above.
2. Open `code/happiness_regression.sas` in SAS Studio or another SAS environment.
3. Replace the placeholder path in the `INFILE` statement with the location of your downloaded CSV file.
4. Run the program. The code produces exploratory scatterplots, the initial regression model and diagnostics, variable-selection results, and the reduced model.

## Tools

- SAS
- Multiple linear regression
- Exploratory data analysis and regression diagnostics
- Forward, backward, and stepwise variable selection

---

*Academic course project. The analysis and interpretation reflect the submitted project report.*
