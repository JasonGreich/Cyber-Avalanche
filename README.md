<img src="./readme/title1.svg"/>

<br><br>

<!-- project philosophy -->
<img src="./readme/title2.svg"/>

> A full-stack data project for analyzing cyber attacks on individuals and companies, combining multiple datasets in a MySQL data warehouse, cleaning and analysis in Python, visualization in Power BI, and using a Random Forest algorithm to predict anomaly score classes.
>
> Cyber Avalanche aims to streamline the process of cyber attack analysis by providing a comprehensive data pipeline from ingestion to visualization and machine learning. The goal is to identify and predict potential anomalies in cyber attack patterns to better understand vulnerabilities and enhance security


### User Stories
- As a user, I want to view visualizations of cyber attack data in Power BI dashboards, so I can quickly gain insights into where and how attacks are happening.

- As a business executive, I want to assess the impact of cyber attacks through detailed reports, so I can make informed decisions about security investments and risk management.

- As a data engineer, I want to ensure the data is processed and updated efficiently from multiple sources, so I can keep the system reliable for continuous analysis.
<br><br>


<!-- Tech stack -->
<img src="./readme/title3.svg"/>

### Cyber Avalanche is built using the following technologies:

- This project uses [MySQL](https://www.mysql.com/) as the primary data warehouse for storing and managing multiple datasets on cyber attacks targeting individuals and companies.

- For data cleaning and preprocessing, [Python](https://www.python.org/) is used along with libraries like Pandas and NumPy, which provide powerful tools for transforming, filtering, and analyzing the data.

- To create visualizations that help identify trends and anomalies in cyber attacks, [Power BI](https://powerbi.microsoft.com/) is utilized for interactive dashboards and reports.

- For machine learning and anomaly detection, a [Random Forest algorithm](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.RandomForestClassifier.html) from Scikit-learn is used to predict anomaly score classes, helping organizations mitigate cyber threats.

- The project adheres to best practices in data engineering, ensuring smooth data ingestion, transformation, and presentation across all stages of the pipeline.

<br><br>

<!-- Database Design -->
<img src="./readme/title5.svg"/>

###  Architecting Data Excellence: Innovative Data Warehouse Design Strategies:

- Below is the ER Diagram that demonstrates the database structure for Cyber Avalanche, showcasing the relationships between the different datasets on cyber attacks targeting individuals and companies.

<img src="./readme/assets/Data Warehouse Design.png"/>


<br><br>


<!-- Implementation -->
<img src="./readme/title6.svg"/>



### User Screens (Power BI report)

| Overview Screen                           | Individual Attacks Analysis                         |
| ----------------------------------------- | ----------------------------------------- |
| ![Demo](./readme/assets/overview.png) | ![Demo](./readme/assets/ind1.png) |

| Device Analysis           | Network Screen                         |
| --------------------------------- | -------------------------------------- |
| ![Demo](./readme/assets/devicde.png) | ![Demo](./readme/assets/network.png) |

| Companies Attacks Analysis             | Time Series Analysis         |
| ----------------------------------- | --------------------------------- |
| ![Demo](./readme/assets/comp1.png) | ![Demo](./readme/assets/time2.png) |

<br><br>


<!-- Prompt Engineering -->
<img src="./readme/title7.svg"/>

### Anomaly Score Prediction Model

Algorithm: Random Forest Classifier

Objective: To predict anomaly score classes in cyber attack data for proactive threat detection.

1. Preprocessing:
   - Dropped irrelevant columns that do not contribute to anomaly prediction.
   - Handled missing values using appropriate techniques such as filling with the mean or using imputation strategies.
   - Normalized and encoded categorical variables like attack type, location, and source using label encoding and one-hot encoding as required.

2. Training:
   - Split the dataset into training (80%) and testing (20%) sets.
   - Trained the model using a Random Forest Classifier with hyperparameter tuning (e.g., 100 estimators, max depth, etc.) to optimize performance.

3. Evaluation:
   - Evaluated model performance based on accuracy and other relevant metrics.
   - Generated a detailed classification report including precision, recall, and F1-score to assess model performance.


<br><br>



<!-- Unit Testing -->
<img src="./readme/title9.svg"/>

### Precision in Development: Harnessing the Power of Validation:

- This project employs rigorous validation checks in SQL to ensure data consistency between the staging area and the data warehouse. By validating that data loaded into the warehouse matches the source datasets, we ensure accuracy and integrity throughout the ETL (Extract, Transform, Load) pipeline. These validation steps are critical in maintaining the quality of analysis on cyber attacks data, ensuring that all insights and predictions are based on reliable and accurate data.

<br><br>


<!-- How to run -->
<img src="./readme/title10.svg"/>

> To set up Coffee Express locally, follow these steps:

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* npm
  ```sh
  npm install npm@latest -g
  ```

### Installation

_Below is an example of how you can instruct your audience on installing and setting up your app. This template doesn't rely on any external dependencies or services._

1. Get a free API Key at [example](https://example.com)
2. Clone the repo
   git clone [github](https://github.com/your_username_/Project-Name.git)
3. Install NPM packages
   ```sh
   npm install
   ```
4. Enter your API in `config.js`
   ```js
   const API_KEY = 'ENTER YOUR API';
   ```

Now, you should be able to run Coffee Express locally and explore its features.