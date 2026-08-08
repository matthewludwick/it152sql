Our clinical IT help database is constructed to satisfy relational integrity principles using five core tables Departments⁠,  Employees⁠,  Machines⁠, Priority⁠, and ⁠Tickets⁠. 

To achieve adequate normalization (3NF), all repeating groups and redundant attributes are eliminated. Data such as department classifications and severity scales are isolated into independent parent entities. This structure relies heavily on strict key constraints with primary keys 
uniquely identifying individual records (eg. ticket_ID) and with foreign keys enhancing referential integrity between tables (eg. ensuring a ticket can only be 
assigned to a valid ⁠employee_ID⁠ or ⁠machine_ID⁠). By linking tables through these foreign key relationships rather than duplicating data, we prevent data entry 
errors and enable multi-table queries that tie tickets directly to their corresponding equipment, employees, and departments. It also allows multiple IT technicians 
to insert, update, and query support tickets concurrently without data corruption.

While this streamlined five table setup effectively manages daily help desk operations, future iterations might consider introducing a dedicated ⁠Resolutions⁠ table 
to handle multiple technician collaborative audit in a single ticket, alongside a more precise parent-child location mapping for asset management.
