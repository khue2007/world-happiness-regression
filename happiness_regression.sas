/*
  World Happiness Report 2024: Applied Regression Analysis
  Academic project using SAS.

  Before running:
  1. Download the World Happiness Report 2024 CSV from:
     https://www.kaggle.com/datasets/jainaru/world-happiness-report-2024-yearly-updated/data
  2. Replace the placeholder path in the INFILE statement below.
*/

/* Import the country-level dataset. */
DATA Happiness;
    INFILE "YOUR_FILE_PATH/World-happiness-report-2024.csv"
        DLM=',' DSD FIRSTOBS=2;
    LENGTH Country $40 RegionalIndicator $60;
    INPUT Country $
          RegionalIndicator $
          LadderScore
          UpperWhisker
          LowerWhisker
          LogGDP
          SocialSupport
          HealthyLifeExpectancy
          Freedom
          Generosity
          Corruption
          DystopiaResidual;
RUN;

/* Exploratory scatterplots with fitted regression lines. */
PROC SGPLOT DATA=Happiness;
    SCATTER X=HealthyLifeExpectancy Y=LadderScore;
    REG X=HealthyLifeExpectancy Y=LadderScore;
    TITLE "Healthy Life Expectancy Contribution and Happiness Score";
RUN;

PROC SGPLOT DATA=Happiness;
    SCATTER X=Freedom Y=LadderScore;
    REG X=Freedom Y=LadderScore;
    TITLE "Freedom Contribution and Happiness Score";
RUN;

PROC SGPLOT DATA=Happiness;
    SCATTER X=Generosity Y=LadderScore;
    REG X=Generosity Y=LadderScore;
    TITLE "Generosity Contribution and Happiness Score";
RUN;

PROC SGPLOT DATA=Happiness;
    SCATTER X=Corruption Y=LadderScore;
    REG X=Corruption Y=LadderScore;
    TITLE "Perceptions of Corruption Contribution and Happiness Score";
RUN;

/* Initial multiple linear regression model and diagnostics. */
PROC REG DATA=Happiness;
    MODEL LadderScore = HealthyLifeExpectancy Freedom Generosity Corruption
        / VIF CLB R INFLUENCE;
    ID Country;
    TITLE "Initial Multiple Linear Regression Model";
RUN;
QUIT;

/* Forward variable selection. */
PROC REG DATA=Happiness;
    MODEL LadderScore = HealthyLifeExpectancy Freedom Generosity Corruption
        / SELECTION=FORWARD SLENTRY=0.05;
    TITLE "Forward Variable Selection";
RUN;
QUIT;

/* Backward variable elimination. */
PROC REG DATA=Happiness;
    MODEL LadderScore = HealthyLifeExpectancy Freedom Generosity Corruption
        / SELECTION=BACKWARD SLSTAY=0.05;
    TITLE "Backward Variable Elimination";
RUN;
QUIT;

/* Stepwise variable selection. */
PROC REG DATA=Happiness;
    MODEL LadderScore = HealthyLifeExpectancy Freedom Generosity Corruption
        / SELECTION=STEPWISE SLENTRY=0.05 SLSTAY=0.05;
    TITLE "Stepwise Variable Selection";
RUN;
QUIT;

/* Final reduced model selected in the project. */
PROC REG DATA=Happiness;
    MODEL LadderScore = HealthyLifeExpectancy Freedom / CLB;
    TITLE "Final Reduced Regression Model";
RUN;
QUIT;

TITLE;
