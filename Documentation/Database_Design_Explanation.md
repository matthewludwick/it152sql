
## Database Structure
The database consists of five major relational tables: Departments, Priority Levels, Employees, Machines, and Tickets. It utilizes 1:M (One-to-Many) relationships. For example, one department has many assigned employees, one machine has multiple support tickets, and one priority level categorizes multiple tickets.Our clinical IT help database is constructed to satisfy relational integrity principles using five core tables Departments⁠,  Employees⁠,  Machines⁠, Priority⁠, and ⁠Tickets⁠. 

## Normalization:
To achieve adequate normalization (3NF), all repeating groups and redundant attributes are eliminated. Data such as department classifications and severity scales are isolated into independent parent entities. This structure relies heavily on strict key constraints with primary keys uniquely identifying individual records (eg. ticket_ID) and with foreign keys enhancing referential integrity between tables (eg. ensuring a ticket can only be assigned to a valid ⁠employee_ID⁠ or ⁠machine_ID⁠). By linking tables through these foreign key relationships rather than duplicating data, we prevent data entry errors and enable multi-table queries that tie tickets directly to their corresponding equipment, employees, and departments. It also allows multiple IT technicians to insert, update, and query support tickets concurrently without data corruption.

While this streamlined five table setup effectively manages daily help desk operations, future iterations might address some of the challenges we encountered and lessons learned.

## Lessons Learned
Normalization & Keys: One of the biggest takeaways for us was seeing firsthand how normalization affects database design. For instance, instead of typing priority statuses like 'High' or 'Low' directly into the tickets table—which could lead to typos and data integrity issues—we learned to separate them into their own Priority Levels table and link them using foreign keys. This taught us exactly how primary and foreign keys work together to keep data organized and accurate without redundancy.

JOINs: We also learned the practical power of JOINs. We realized that extracting meaningful data to answer a real-world question, like 'What devices are each technician working on?', often requires joining three or four different tables together, such as joining tickets, employees, and machines to track which technician is working on a specific device.

VIEWs: Because JOINs can get complex, we learned how views simplify complicated queries.Instead of writing a massive query every time we needed to see active issues, we created an open_tickets view that pre-joined the tickets, departments, and employees tables. 

INDEXES: We realized how indexes can improve database performance. While primary keys automatically index data, adding indexes to heavily searched foreign keys,like the technician ID, would drastically speed up search times as the database grows to handle thousands of hospital tickets.

## Challenges
Limiting Scope: Our biggest challenge was limiting the scope of our tables despite the complexity of a medical system. Currently, our diagram assigns one IT employee to one ticket, but this fails to account for real-world ticket escalations where multiple technicians collaborate. A future iteration might consider introducing a dedicated Resolutions table to handle multiple technician collaborative audit in a single ticket, alongside a more precise parent-child location mapping for asset management.

Balancing Normalization with Real-World Issues: Another significant challenge involved ensuring our database adhered to the 3NF while still reflecting real-world hospital scenarios. Specifically, we struggled with how to log a ticket for a department-wide issue like a network outage that wasn't tied to one specific machine. Addressing this would require redesigning the database to allow `machine_ID` to accept NULL values for department-wide tickets.

Naming Conventions: Lastly, we realized that one of our column names, 'job_role', was misleading for its purpose. It should have been named `reported_by`, highlighting the importance of clear, descriptive column names for maintaining the database.
