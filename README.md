# ETL-project

ETL Project

Team Members: Sanjive Agarwal, Kasia Kalemba, Akshita Parasrampuria, Mitesh Parekh

Scope: Extract, Transform, and Load data from various sources to help facilitate analyses related to flight cancellations

Data Sources:
•	U.S. Department of Transportation’s (DOT) Bureau of Transportation Statistics 
•	Kaggle (site for downloading datafiles)

Data Files Extracted: 
•	Airlines (CSV file)
•	US Airports (CSV file)
•	Cancellation Codes Table (CSV File)
•	2015 Flight Schedule (CSV File)

Data Transformation via Python/Jupyter Notebook:
•	Data Selection: selecting cancelled flights and relevant data points
•	Data Summarization: creating a Date field from Day, Month, Year fields and storing as a Datetime field
•	Data Joining: 
o	Using IATA_Code to join Airports and Cancellef_Flights to add in airport information
o	Using Cancellation_Reason_Code to join Cancelled_Flights and Cancellation_code table to show Cancellation Reason with Cancelled Flight information  
•	Data Cleaning: removing unnecessary columns from data prior to loading
 
Data Loading:
•	Schema visualized via quickdatabasediagrams.com

 
•	PGAdmin Platform
•	Tables
o	Airports (IATA_Code = Primary Key)
o	Cancelled Flights
o	Airlines (IATA_Code = Primary Key)
o	Cancellation Code (Cancellation_Reason_Code = Primary Key)



Possible Data Analyses:
•	Flight Cancellation Reasons
o	Percentage breakdown of cancellation reasons
o	Cancellations due to weather by month of the year
o	Weather Cancellations vs. Latitude
o	Trending of cancellation reasons by day of week
o	Trending of cancellation reasons by month
•	Airline Cancellations
o	Number of cancellations per airline
o	Cancellation reasons broken down by airline
•	Airport Cancellations
o	Number of cancellations by origin airport
o	Number of cancellations by destination airport

Sample Data Analysis

Heatmap of Airports in the United States:

 


