CREATE TABLE person (
    person_id INT NOT NULL,
    social_security_number VARCHAR(12) UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(10) UNIQUE,
    zip_code VARCHAR(5) NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    PRIMARY KEY (person_id)
);

CREATE TABLE instructor (
    instructor_id INT NOT NULL,
    salary INT NOT NULL,
    instrument_type VARCHAR(100) NOT NULL,
    lesson_type VARCHAR(100) NOT NULL,
    person_id INT NOT NULL,
    PRIMARY KEY (instructor_id),
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE staff (
    staff_id INT NOT NULL,
    work_position VARCHAR(100) NOT NULL,
    person_id INT NOT NULL,
    instructor_id INT,
    PRIMARY KEY (staff_id),
    FOREIGN KEY (person_id) REFERENCES person(person_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

CREATE TABLE student (
    student_id INT NOT NULL,
    skill_level VARCHAR(100) NOT NULL,
    person_id INT NOT NULL,
    PRIMARY KEY (student_id),
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE music_genre (
    genre_id INT NOT NULL,
    genre VARCHAR(100) NOT NULL,
    PRIMARY KEY (genre_id)
);

CREATE TABLE instrument (
    instrument_id INT NOT NULL,
    instrument_type VARCHAR(100) NOT NULL,
    PRIMARY KEY (instrument_id)
);

CREATE TABLE instrument_stock (
    stock_id INT NOT NULL,
    stock_quantity INT NOT NULL,
    PRIMARY KEY (stock_id)
);

CREATE TABLE applicant_interface (
    system_id INT NOT NULL,
    staff_id INT NOT NULL,
    student_information VARCHAR(500) NOT NULL,
    finance_information VARCHAR(500) NOT NULL,
    sibling_information VARCHAR(500) NOT NULL,
    instrument_rental_information VARCHAR(500) NOT NULL,
    PRIMARY KEY (system_id, staff_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE contact_person (
    contact_person_id INT NOT NULL,
    relationship VARCHAR(100) NOT NULL,
    student_id INT NOT NULL,
    person_id INT NOT NULL,
    PRIMARY KEY (contact_person_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE student_sibling (
    sibling_id INT NOT NULL,
    student_id INT NOT NULL,
    number_of_siblings INT NOT NULL,
    PRIMARY KEY (sibling_id, student_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE student_payment (
    billing_id INT NOT NULL,
    amount INT NOT NULL,
    payment_date DATE NOT NULL,
    sibling_discount INT,
    student_id INT NOT NULL,
    PRIMARY KEY (billing_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE ensembles (
    ensemble_id INT NOT NULL,
    instructor_id INT NOT NULL,
    student_id INT NOT NULL,
    max_students INT NOT NULL,
    min_students INT NOT NULL,
    instrument_type VARCHAR(100) NOT NULL,
    lesson_type VARCHAR(100) NOT NULL,
    skill_level VARCHAR(100) NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (ensemble_id, instructor_id, student_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (genre_id) REFERENCES music_genre(genre_id),
    UNIQUE (ensemble_id, instructor_id, student_id)
);

CREATE TABLE individual_lesson (
    individual_lesson_id INT NOT NULL,
    instructor_id INT NOT NULL,
    student_id INT NOT NULL,
    instrument_type VARCHAR(100) NOT NULL,
    lesson_type VARCHAR(100) NOT NULL,
    skill_level VARCHAR(100) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    PRIMARY KEY (individual_lesson_id, instructor_id, student_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    UNIQUE (individual_lesson_id, instructor_id, student_id)
);

CREATE TABLE group_lessons (
    group_lesson_id INT NOT NULL,
    instructor_id INT NOT NULL,
    student_id INT NOT NULL,
    max_students INT NOT NULL,
    min_students INT NOT NULL,
    instrument_type VARCHAR(100) NOT NULL,
    lesson_type VARCHAR(100) NOT NULL,
    skill_level VARCHAR(100) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    PRIMARY KEY (group_lesson_id, instructor_id, student_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    UNIQUE (group_lesson_id, instructor_id, student_id)
);

CREATE TABLE renting_instrument (
    rental_id INT NOT NULL,
    student_id INT NOT NULL,
    instrument_id INT NOT NULL,
    rental_start_date DATE NOT NULL,
    rental_end_date DATE,
    stock_id INT,
    PRIMARY KEY (rental_id, instrument_id, stock_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (instrument_id) REFERENCES instrument(instrument_id),
    FOREIGN KEY (stock_id) REFERENCES instrument_stock(stock_id)
);

CREATE TABLE instructor_salary (
    instructor_id INT NOT NULL,
    amount INT NOT NULL,
    work_time INT NOT NULL,
    PRIMARY KEY (instructor_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

CREATE TABLE price_lesson_layout (
    price_id INT NOT NULL,
    price INT NOT NULL,
    skill_level VARCHAR(100) NOT NULL,
    lesson_type VARCHAR(100) NOT NULL,
    PRIMARY KEY (price_id)
);

CREATE TABLE booking (
    time_slot_id INT NOT NULL,
    instructor_id INT NOT NULL,
    price_id INT NOT NULL,
    scheduled_time DATE NOT NULL,
    PRIMARY KEY (price_id),
    FOREIGN KEY (instructor_id, time_slot_id) REFERENCES instructor(instructor_id),
    FOREIGN KEY (price_id) REFERENCES price_lesson_layout(price_id)
);

CREATE TABLE price_lesson_layout_ensembles (
    price_id INT NOT NULL,
    ensemble_id INT NOT NULL,
    instructor_id INT NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (price_id, ensemble_id, instructor_id, student_id),
    FOREIGN KEY (ensemble_id, instructor_id, student_id) REFERENCES ensembles(ensemble_id, instructor_id, student_id) ON DELETE CASCADE,
    FOREIGN KEY (price_id) REFERENCES price_lesson_layout(price_id) ON DELETE CASCADE
);

CREATE TABLE price_lesson_layout_individual_lesson (
    price_id INT NOT NULL,
    individual_lesson_id INT NOT NULL,
    instructor_id INT NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (price_id, individual_lesson_id, instructor_id, student_id),
    FOREIGN KEY (individual_lesson_id, instructor_id, student_id) REFERENCES individual_lesson(individual_lesson_id, instructor_id, student_id) ON DELETE CASCADE,
    FOREIGN KEY (price_id) REFERENCES price_lesson_layout(price_id) ON DELETE CASCADE
);

CREATE TABLE price_lesson_layout_group_lessons (
    price_id INT NOT NULL,
    group_lesson_id INT NOT NULL,
    instructor_id INT NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (price_id, group_lesson_id, instructor_id, student_id),
    FOREIGN KEY (group_lesson_id, instructor_id, student_id) REFERENCES group_lessons(group_lesson_id, instructor_id, student_id) ON DELETE CASCADE,
    FOREIGN KEY (price_id) REFERENCES price_lesson_layout(price_id) ON DELETE CASCADE
);