# Bike-Sharing Chicago Data  
Exploratory analysis of rider behavior among casual users and members of Divvy Bikes by Lyft to support data-driven decision-making.  

**Data Source**: [Divvy Bikes Data License Agreement](https://divvy-tripdata.s3.amazonaws.com/index.html)  
**License**: [Divvy Data License Agreement](https://divvybikes.com/data-license-agreement)  
**Data Used**: January to November 2024  

---

## **Business Task**  
**Increasing the profitability of a bike-sharing company**  

To guide the analysis, the following questions were crafted:  
1. How do annual members and casual riders use Divvy Bikes differently?  
2. Why would casual riders consider purchasing Divvy annual memberships?  
3. How can Divvy streamline and optimize their product offerings?  

---

## **Processes**  
- Cleaned CSV data for consistent formatting and usability using R.  
- Created the following visualizations and summaries:  
  - **Summary Interactive Table**: For a quick data overview (using the `DT` package).  
  - **Scatterplot with Smoothing**: Showcasing relationships between days of the week, bike usage frequency, and average ride time (in minutes).  
  - **Heat Map**: Highlighting the popularity of each ride type across Chicago locations.  

**See the `bikeShare.R` script for details on data cleaning and visualization steps.**  

---

## **Key Findings**  
- Members have higher bike usage than casual riders on all days.  
- On weekends, both members and casual riders ride for longer durations than their average time.  
- Casual riders have almost double the average ride length compared to members.  

---

## **Summary Analysis**  
- **Ride Duration**: Casual riders spend an average of 25.3 minutes per trip, 97% longer than member riders (12.8 minutes).  
- **Usage Patterns**: Despite their longer trips, casual riders have lower bike usage across all days.  
- **Bike Preference**: Classic bikes dominate rides and are primarily used in tourism-heavy locations (e.g., Streeter Dr & Grand Ave, DuSable Lake Shore Dr).  

### **Behavioral Insights**  
- **Members**: Frequent users, typically for shorter commutes (e.g., work or school), leveraging bikes as a cost-effective alternative to cars.  
- **Casual Riders**: Ride for longer durations but less frequently, driven by leisure activities, events, and tourism, especially on weekends.  

---

## **Recommendations**  
1. **Geo-Targeted Marketing**:  
   - Promote classic bike rides in high-traffic tourist areas (e.g., Streeter Dr & Grand Ave) and use geo-targeted ads near hotels, tourist attractions, and event venues.  
   - Highlight the fun and recreational aspects of cycling to attract casual riders.  

2. **Tourism Collaborations**:  
   - Partner with local tourism boards to include cycling routes as part of Chicago’s tourism packages.  

3. **Weekend Packages**:  
   - Offer weekend-specific or event-based ride passes to appeal to tourists and leisure riders, encouraging longer rides and increased usage.  

4. **Localized Promotions**:  
   - Tailor campaigns for local neighborhoods with frequent member riders, emphasizing convenience and cost savings.  

---

## **Further Study**  
- **Feedback Loops**:  
  - Conduct surveys for both casual and member riders to refine product offerings and improve marketing strategies.  
