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

CREATE TABLE student (
    student_id INT NOT NULL,
    skill_level VARCHAR(100) NOT NULL,
    person_id INT NOT NULL,
    PRIMARY KEY (student_id),
    FOREIGN KEY (person_id) REFERENCES person(person_id)
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

CREATE TABLE renting_instrument (
    rental_id INT NOT NULL,
    instrument_id INT NOT NULL,
    stock_id INT NOT NULL,
    effective_from TIMESTAMP NOT NULL,
    effective_to TIMESTAMP NOT NULL,
    rental_price INT NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (rental_id),
    FOREIGN KEY (instrument_id) REFERENCES instrument(instrument_id),
    FOREIGN KEY (stock_id) REFERENCES instrument_stock(stock_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE booking (
    time_slot_id INT NOT NULL UNIQUE,
    instructor_id INT NOT NULL,
    schedule_time DATE NOT NULL,
    PRIMARY KEY (time_slot_id, instructor_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

CREATE TABLE price_lesson_layout (
    price_id INT NOT NULL,
    amount INT NOT NULL,
    skill_level VARCHAR(100) NOT NULL,
    lesson_type VARCHAR(100) NOT NULL,
    time_slot_id INT NOT NULL,
    instructor_id INT NOT NULL,
    PRIMARY KEY (price_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
    FOREIGN KEY (time_slot_id) REFERENCES booking(time_slot_id)
);

CREATE TABLE lesson_price_history (
    price_history_id INT NOT NULL UNIQUE,
    price_id INT NOT NULL UNIQUE,
    lesson_type VARCHAR(100) NOT NULL,
    skill_level VARCHAR(100) NOT NULL,
    amount INT NOT NULL,
    effective_from TIMESTAMP NOT NULL,
    effective_to TIMESTAMP NOT NULL,
    FOREIGN KEY (price_id) REFERENCES price_lesson_layout(price_id),
    PRIMARY KEY (price_history_id, price_id)
);

CREATE TABLE ensembles (
    ensemble_id INT NOT NULL UNIQUE,
    instructor_id INT NOT NULL UNIQUE,
    max_students INT NOT NULL,
    min_students INT NOT NULL,
    instrument_type VARCHAR(100) NOT NULL,
    lesson_type VARCHAR(100) NOT NULL,
    skill_level VARCHAR(100) NOT NULL,
    genre_id INT NOT NULL,
    price_id INT,
    price_history_id INT,
    PRIMARY KEY (ensemble_id, instructor_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
    FOREIGN KEY (genre_id) REFERENCES music_genre(genre_id),
    FOREIGN KEY (price_id) REFERENCES price_lesson_layout(price_id),
    FOREIGN KEY (price_history_id) REFERENCES lesson_price_history(price_history_id)
);

CREATE TABLE individual_lesson (
    individual_lesson_id INT NOT NULL,
    instructor_id INT NOT NULL,
    student_id INT NOT NULL,
    instrument_type VARCHAR(100) NOT NULL,
    lesson_type VARCHAR(100) NOT NULL,
    skill_level VARCHAR(100) NOT NULL,
    price_id INT,
    price_history_id INT,
    PRIMARY KEY (individual_lesson_id, instructor_id, student_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (price_id) REFERENCES price_lesson_layout(price_id),
    FOREIGN KEY (price_history_id) REFERENCES lesson_price_history(price_history_id)
);

CREATE TABLE group_lessons (
    group_lesson_id INT NOT NULL UNIQUE,
    instructor_id INT NOT NULL UNIQUE,
    max_students INT NOT NULL,
    min_students INT NOT NULL,
    instrument_type VARCHAR(100) NOT NULL,
    lesson_type VARCHAR(100) NOT NULL,
    skill_level VARCHAR(100) NOT NULL,
    price_id INT,
    price_history_id INT,
    PRIMARY KEY (group_lesson_id, instructor_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
    FOREIGN KEY (price_id) REFERENCES price_lesson_layout(price_id),
    FOREIGN KEY (price_history_id) REFERENCES lesson_price_history(price_history_id)
);

CREATE TABLE student_payment (
    billing_id INT NOT NULL,
    amount INT NOT NULL,
    payment_date DATE NOT NULL,
    sibling_discount INT,
    student_id INT,
    price_history_id INT NOT NULL UNIQUE,
    price_id INT NOT NULL,
    PRIMARY KEY (billing_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (price_history_id) REFERENCES lesson_price_history(price_history_id),
    FOREIGN KEY (price_id) REFERENCES lesson_price_history(price_id) 
);

CREATE TABLE booking_student_payment (
    time_slot_id INT NOT NULL UNIQUE,
    instructor_id INT NOT NULL,
    billing_id INT NOT NULL,
    PRIMARY KEY (time_slot_id, instructor_id, billing_id),
    FOREIGN KEY (time_slot_id, instructor_id) REFERENCES booking(time_slot_id, instructor_id) ON DELETE CASCADE,
    FOREIGN KEY (billing_id) REFERENCES student_payment(billing_id) ON DELETE CASCADE
);

CREATE TABLE price_lesson_layout_group_lessons (
    price_id INT NOT NULL,
    group_lesson_id INT NOT NULL,
    instructor_id INT NOT NULL,
    FOREIGN KEY (group_lesson_id, instructor_id) REFERENCES group_lessons(group_lesson_id, instructor_id) ON DELETE CASCADE,
    FOREIGN KEY (price_id) REFERENCES price_lesson_layout(price_id) ON DELETE CASCADE
);

CREATE TABLE price_lesson_layout_ensembles (
    price_id INT NOT NULL,
    ensemble_id INT NOT NULL,
    instructor_id INT NOT NULL,
    FOREIGN KEY (ensemble_id, instructor_id) REFERENCES ensembles(ensemble_id, instructor_id) ON DELETE CASCADE,
    FOREIGN KEY (price_id) REFERENCES price_lesson_layout(price_id) ON DELETE CASCADE
);

CREATE TABLE price_lesson_layout_individual_lesson (
    price_id INT NOT NULL,
    individual_lesson_id INT NOT NULL,
    instructor_id INT NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (individual_lesson_id, instructor_id, student_id) REFERENCES individual_lesson(individual_lesson_id, instructor_id, student_id) ON DELETE CASCADE,
    FOREIGN KEY (price_id) REFERENCES price_lesson_layout(price_id) ON DELETE CASCADE
);

CREATE TABLE group_lesson_students (
    group_lesson_id INT NOT NULL,
    student_id INT NOT NULL,
    instructor_id INT NOT NULL,
    FOREIGN KEY (group_lesson_id, instructor_id) REFERENCES group_lessons(group_lesson_id, instructor_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE ensemble_students (
    ensemble_id INT NOT NULL,
    student_id INT NOT NULL,
    instructor_id INT NOT NULL,
    FOREIGN KEY (ensemble_id, instructor_id) REFERENCES ensembles(ensemble_id, instructor_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);



/*Enforces that student can only rent maximum two instruments concurrently*/
CREATE OR REPLACE FUNCTION enforce_instrument_limit()
RETURNS TRIGGER AS $$
BEGIN

    IF (
        SELECT COUNT(*)
        FROM renting_instrument
        WHERE student_id = NEW.student_id
          AND effective_from <= NOW()
          AND effective_to >= NOW()
    ) >= 2 THEN
        RAISE EXCEPTION 'A student can only rent up to two instruments at a time.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_instrument_limit_trigger
BEFORE INSERT OR UPDATE ON renting_instrument
FOR EACH ROW
EXECUTE FUNCTION enforce_instrument_limit();



