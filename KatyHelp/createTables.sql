CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);

CREATE TABLE TicketTypes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Tickets (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    type_id INT NOT NULL,
    visit_date DATE NOT NULL,
    qr_code VARCHAR(100),
    status VARCHAR(50),
    CONSTRAINT fk_ticket_user_id FOREIGN KEY (user_id) REFERENCES Users (id),
    CONSTRAINT fk_ticket_type_id FOREIGN KEY (type_id) REFERENCES TicketTypes (id)
);