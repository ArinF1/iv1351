INSERT INTO person (person_id, social_security_number, first_name, surname, email, phone_number, zip_code, street, city) VALUES
(1, '123456789001', 'Alice', 'Johnson', 'alice.johnson@email.com', '0701234567', '12345', 'Main St 1', 'Stockholm'),
(2, '123456789002', 'Bob', 'Smith', 'bob.smith@email.com', '0701234568', '12345', 'Main St 2', 'Stockholm'),
(3, '123456789003', 'Charlie', 'Brown', 'charlie.brown@email.com', '0701234569', '12345', 'Main St 3', 'Stockholm'),
(4, '123456789004', 'David', 'Williams', 'david.williams@email.com', '0701234570', '12345', 'Main St 4', 'Stockholm'),
(5, '123456789005', 'Emma', 'Davis', 'emma.davis@email.com', '0701234571', '12345', 'Main St 5', 'Stockholm'),
(6, '123456789006', 'Frank', 'Miller', 'frank.miller@email.com', '0701234572', '12345', 'Main St 6', 'Stockholm'),
(7, '123456789007', 'Grace', 'Wilson', 'grace.wilson@email.com', '0701234573', '12345', 'Main St 7', 'Stockholm'),
(8, '123456789008', 'Henry', 'Moore', 'henry.moore@email.com', '0701234574', '12345', 'Main St 8', 'Stockholm'),
(9, '123456789009', 'Ivy', 'Taylor', 'ivy.taylor@email.com', '0701234575', '12345', 'Main St 9', 'Stockholm'),
(10, '123456789010', 'Jack', 'Anderson', 'jack.anderson@email.com', '0701234576', '12345', 'Main St 10', 'Stockholm'),
(11, '123456789011', 'Katie', 'Thomas', 'katie.thomas@email.com', '0701234577', '12345', 'Main St 11', 'Stockholm'),
(12, '123456789012', 'Liam', 'Jackson', 'liam.jackson@email.com', '0701234578', '12345', 'Main St 12', 'Stockholm'),
(13, '123456789013', 'Mia', 'White', 'mia.white@email.com', '0701234579', '12345', 'Main St 13', 'Stockholm'),
(14, '123456789014', 'Noah', 'Harris', 'noah.harris@email.com', '0701234580', '12345', 'Main St 14', 'Stockholm'),
(15, '123456789015', 'Olivia', 'Martin', 'olivia.martin@email.com', '0701234581', '12345', 'Main St 15', 'Stockholm'),
(16, '223456789016', 'Paul', 'Clark', 'paul.clark@email.com', '0701234582', '12345', 'Main St 16', 'Stockholm'),
(17, '223456789017', 'Quinn', 'Rodriguez', 'quinn.rodriguez@email.com', '0701234583', '12345', 'Main St 17', 'Stockholm'),
(18, '223456789018', 'Rita', 'Lewis', 'rita.lewis@email.com', '0701234584', '12345', 'Main St 18', 'Stockholm'),
(19, '223456789019', 'Steve', 'Walker', 'steve.walker@email.com', '0701234585', '12345', 'Main St 19', 'Stockholm'),
(20, '223456789020', 'Tina', 'Hall', 'tina.hall@email.com', '0701234586', '12345', 'Main St 20', 'Stockholm');

INSERT INTO student (student_id, skill_level, person_id) VALUES
(1, 'Beginner', 1),
(2, 'Intermediate', 2),
(3, 'Advanced', 3),
(4, 'Beginner', 4),
(5, 'Intermediate', 5),
(6, 'Advanced', 6),
(7, 'Beginner', 7),
(8, 'Intermediate', 8),
(9, 'Advanced', 9),
(10, 'Beginner', 10),
(11, 'Intermediate', 11),
(12, 'Advanced', 12),
(13, 'Beginner', 13),
(14, 'Intermediate', 14),
(15, 'Advanced', 15);

INSERT INTO instructor (instructor_id, salary, instrument_type, lesson_type, person_id) VALUES
(1, 30000, 'Piano', 'Individual', 16),
(2, 32000, 'Guitar', 'Group', 17),
(3, 35000, 'Violin', 'Ensemble', 18),
(4, 31000, 'Drums', 'Individual', 19),
(5, 33000, 'Flute', 'Group', 20);

INSERT INTO student_sibling (student_id, sibling_id, number_of_siblings) VALUES
(1, 2, 2),
(1, 3, 2),
(2, 1, 2),
(2, 3, 2),
(3, 1, 2),
(3, 2, 2),
(4, 5, 1),
(5, 4, 1),
(6, 7, 1),
(7, 6, 1),
(8, 9, 1),
(9, 8, 1);

INSERT INTO music_genre (genre_id, genre) VALUES
(1, 'Classical'),
(2, 'Jazz'),
(3, 'Rock'),
(4, 'Pop'),
(5, 'Blues'),
(6, 'Jazz'),
(7, 'Blues');

INSERT INTO instrument (instrument_id, instrument_type) VALUES
(1, 'Piano'),
(2, 'Guitar'),
(3, 'Violin'),
(4, 'Drums'),
(5, 'Flute');

INSERT INTO instrument_stock (stock_id, stock_quantity) VALUES
(1, 10),
(2, 8),
(3, 5),
(4, 7),
(5, 6);

INSERT INTO renting_instrument (rental_id, instrument_id, stock_id, effective_from, effective_to, rental_price, student_id) VALUES
(1, 1, 1, '2024-01-01 10:00:00', '2024-12-31 10:00:00', 500, 1),
(2, 2, 2, '2024-02-01 10:00:00', '2024-12-31 10:00:00', 450, 3),
(3, 3, 3, '2024-03-01 10:00:00', '2024-12-31 10:00:00', 400, 5);

INSERT INTO booking (time_slot_id, instructor_id, schedule_time) VALUES
(1, 1, '2024-12-01'),
(2, 2, '2024-12-02'),
(3, 3, '2024-12-03'),
(201, 1, '2024-12-04'),
(202, 2, '2024-12-05'),
(203, 3, '2024-12-06'),
(301, 1, '2024-10-05'),
(302, 2, '2024-10-12'),
(303, 3, '2024-10-19'),
(304, 4, '2024-11-05'),
(305, 5, '2024-11-12'),
(306, 1, '2024-11-19'),
(401, 1, '2024-12-08'),
(402, 2, '2024-12-09'),
(403, 3, '2024-12-10');


INSERT INTO price_lesson_layout (price_id, amount, skill_level, lesson_type, time_slot_id, instructor_id) VALUES
(1, 120, 'Beginner', 'Individual', 1, 1),
(2, 170, 'Intermediate', 'Individual', 1, 1),
(3, 220, 'Advanced', 'Individual', 1, 1),
(4, 140, 'Beginner', 'Group', 2, 2),
(5, 190, 'Intermediate', 'Group', 2, 2),
(6, 240, 'Advanced', 'Group', 2, 2),
(7, 160, 'Beginner', 'Ensemble', 3, 3),
(8, 210, 'Intermediate', 'Ensemble', 3, 3),
(9, 260, 'Advanced', 'Ensemble', 3, 3);

INSERT INTO lesson_price_history (price_history_id, price_id, lesson_type, skill_level, amount, effective_from, effective_to) VALUES
(1, 1, 'Individual', 'Beginner', 100, '2023-01-01 10:00:00', '2023-12-31 10:00:00'),
(2, 2, 'Individual', 'Intermediate', 150, '2023-01-01 10:00:00', '2023-12-31 10:00:00'),
(3, 3, 'Individual', 'Advanced', 200, '2023-01-01 10:00:00', '2023-12-31 10:00:00'),
(4, 4, 'Group', 'Beginner', 120, '2023-01-01 10:00:00', '2023-12-31 10:00:00'),
(5, 5, 'Group', 'Intermediate', 170, '2023-01-01 10:00:00', '2023-12-31 10:00:00'),
(6, 6, 'Group', 'Advanced', 220, '2023-01-01 10:00:00', '2023-12-31 10:00:00'),
(7, 7, 'Ensemble', 'Beginner', 140, '2023-01-01 10:00:00', '2023-12-31 10:00:00'),
(8, 8, 'Ensemble', 'Intermediate', 190, '2023-01-01 10:00:00', '2023-12-31 10:00:00'),
(9, 9, 'Ensemble', 'Advanced', 240, '2023-01-01 10:00:00', '2023-12-31 10:00:00');

INSERT INTO ensembles (ensemble_id, instructor_id, max_students, min_students, instrument_type, lesson_type, skill_level, genre_id, price_id,price_history_id) VALUES
(101, 1, 3, 2, 'Piano', 'Ensemble', 'Advanced', 1,1,1),
(102, 2, 5, 3, 'Guitar', 'Ensemble', 'Intermediet', 2,2,2),
(103, 3, 4, 2, 'Violin', 'Ensemble', 'Beginner', 3,3,3),
(104, 4, 5, 3, 'Piano', 'Ensemble', 'Advanced', 1,4,4),
(105, 5, 6, 3, 'Guitar', 'Ensemble', 'Intermediet', 2,5,5);

INSERT INTO individual_lesson (individual_lesson_id, instructor_id, student_id, instrument_type, lesson_type, skill_level, price_id, price_history_id) VALUES
(1, 1, 1, 'Piano', 'Individual', 'Beginner', 1, 1),
(2, 1, 2, 'Piano', 'Individual', 'Intermediate', 2, 2),
(3, 1, 3, 'Piano', 'Individual', 'Advanced', 3, 3);

INSERT INTO group_lessons (group_lesson_id, instructor_id, max_students, min_students, instrument_type, lesson_type, skill_level, price_id, price_history_id) VALUES
(1, 2, 8, 4, 'Guitar', 'Group', 'Intermediate', 5, 5),
(2, 3, 8, 4, 'Guitar', 'Group', 'Beginner', 4, 4),
(3, 5, 8, 4, 'Flute', 'Group', 'Intermediate', 5, 5);

INSERT INTO student_payment (billing_id, amount, payment_date, sibling_discount, student_id, price_history_id, price_id) VALUES
(1, 100, '2024-11-01', 0, 1, 1, 1),
(2, 150, '2024-11-02', 10, 2, 2, 2);

INSERT INTO booking_student_payment (time_slot_id, instructor_id, billing_id) VALUES
(1, 1, 1),
(2, 2, 2);


INSERT INTO price_lesson_layout_group_lessons (price_id, group_lesson_id, instructor_id) VALUES
(5, 1, 2);

INSERT INTO price_lesson_layout_ensembles (price_id, ensemble_id, instructor_id) VALUES
(9, 101, 1);

INSERT INTO price_lesson_layout_individual_lesson (price_id, individual_lesson_id, instructor_id, student_id) VALUES
(1, 1, 1, 1);

INSERT INTO group_lesson_students (group_lesson_id, student_id, instructor_id) VALUES
(1, 2, 2),
(1, 4, 2),
(1, 6, 2);

INSERT INTO ensemble_students (ensemble_id, student_id, instructor_id) VALUES
(101, 1, 1),
(101, 2, 1),
(101, 3, 1),
(102, 4, 2),
(102, 5, 2),
(102, 6, 2),
(102, 7, 2),
(102, 8, 2),
(103, 9, 3),
(103, 10, 3),
(103, 11, 3),
(103, 12, 3);


