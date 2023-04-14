TRUNCATE TABLE users RESTART IDENTITY CASCADE;



INSERT INTO users (name, username, email_address, password) VALUES ('Jack', 'jack_chitter', 'jack@mail.com', 'pass1');
INSERT INTO users (name, username, email_address, password) VALUES ('Charlotte', 'chaz_chitter', 'chaz@mail.com', 'pass2');