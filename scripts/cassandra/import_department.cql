CREATE KEYSPACE IF NOT EXISTS enron WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
CREATE TABLE enron.department(id text PRIMARY KEY, name text, location text);
INSERT INTO enron.department (id, name, location) VALUES ('DEF', 'Defence', '1 Infinite Loop, Cupertino, CA 95014');
INSERT INTO enron.department (id, name, location) VALUES ('F', 'Finance', '8 Rue de Londres, Paris, 75009');
INSERT INTO enron.department (id, name, location) VALUES ('CA', 'Communications and  Arts', '1253 McGill College, Montreal, Quebec, H3B 2Y5');
INSERT INTO enron.department (id, name, location) VALUES ('AWR', 'Agriculture and Water Resources', '1600 Amphitheatre Parkway, Mountain View, CA 94043');
INSERT INTO enron.department (id, name, location) VALUES ('HS', 'Human Services', '320 N. Morgan, Chicago, IL 60607');
INSERT INTO enron.department (id, name, location) VALUES ('PMC', 'Prime Minister and Cabinet', '2590 Pearl Street, Boulder, CO 80302');
INSERT INTO enron.department (id, name, location) VALUES ('SS', 'Social Services', 'Unter den Linden 14, Berlin,10117');
INSERT INTO enron.department (id, name, location) VALUES ('IIS', 'Industry, Innovation and Science', '114 Willits Street, Birmingham, MI 48009');
INSERT INTO enron.department (id, name, location) VALUES ('ET', 'Education and Training', '7 Goldschmidtstraße, Göttingen, 37077');
INSERT INTO enron.department (id, name, location) VALUES ('H', 'Health', '355 Main Street, Cambridge, MA 02142');
