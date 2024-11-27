INSERT INTO person (person_id, social_security_number, first_name, surname, email, phone_number, zip_code, street, city)
VALUES
  (1, '1234567891', 'Michael', 'Johnson', 'michael.johnson@example.com', '0701234567', '12345', 'Baker Street 221B', 'Stockholm'),
  (2, '2345678912', 'Laura', 'Smith', 'laura.smith@example.com', '0702345678', '54321', 'Elm Street 742', 'Uppsala'),
  (3, '3456789123', 'Daniel', 'Brown', 'daniel.brown@example.com', '0703456789', '67890', 'Oak Avenue 12', 'Gothenburg'),
  (4, '4567891234', 'Emily', 'Davis', 'emily.davis@example.com', '0704567890', '98765', 'Maple Lane 34', 'Malmo'),
  (5, '5678912345', 'James', 'Wilson', 'james.wilson@example.com', '0705678901', '11223', 'Pine Street 56', 'Lund'),
  (6, '6789123456', 'Sarah', 'Taylor', 'sarah.taylor@example.com', '0706789012', '22134', 'Cedar Road 78', 'Helsingborg'),
  (7, '7891234567', 'David', 'Anderson', 'david.anderson@example.com', '0707890123', '33445', 'Birch Drive 90', 'Linkoping'),
  (8, '8912345678', 'Emma', 'Thomas', 'emma.thomas@example.com', '0708901234', '44356', 'Fir Street 12', 'Vasteras');

INSERT INTO instructor (instructor_id, salary, instrument_type, lesson_type, person_id)
VALUES
  (1, 50000, 'Piano', 'Individual', 1),
  (2, 45000, 'Guitar', 'Group', 2),
  (3, 48000, 'Violin', 'Individual', 3),
  (4, 47000, 'Drums', 'Group', 4);

INSERT INTO staff (staff_id, work_position, person_id, instructor_id)
VALUES
  (1, 'Manager', 5, NULL),
  (2, 'Assistant', 6, 1),
  (3, 'Coordinator', 7, 2),
  (4, 'Receptionist', 8, 3);

INSERT INTO student (student_id, skill_level, person_id)
VALUES
  (1, 'Beginner', 1),
  (2, 'Intermediate', 2),
  (3, 'Advanced', 3),
  (4, 'Beginner', 4);

INSERT INTO music_genre (genre_id, genre)
VALUES
  (1, 'Classical'),
  (2, 'Jazz'),
  (3, 'Rock'),
  (4, 'Pop');

INSERT INTO instrument (instrument_id, instrument_type)
VALUES
  (1, 'Piano'),
  (2, 'Guitar'),
  (3, 'Violin'),
  (4, 'Drums');

INSERT INTO instrument_stock (stock_id, stock_quantity)
VALUES
  (1, 10),
  (2, 8),
  (3, 12),
  (4, 5);

INSERT INTO applicant_interface (system_id, staff_id, student_information, finance_information, sibling_information, instrument_rental_information)
VALUES
  (1, 1, 'Student Info 1', 'Finance Info 1', 'Sibling Info 1', 'Rental Info 1'),
  (2, 2, 'Student Info 2', 'Finance Info 2', 'Sibling Info 2', 'Rental Info 2');

INSERT INTO contact_person (contact_person_id, relationship, student_id, person_id)
VALUES
  (1, 'Parent', 1, 5),
  (2, 'Guardian', 2, 6),
  (3, 'Sibling', 3, 7),
  (4, 'Friend', 4, 8);

INSERT INTO student_sibling (sibling_id, student_id, number_of_siblings)
VALUES
  (1, 1, 2),
  (2, 2, 1),
  (3, 3, 3),
  (4, 4, 1);

INSERT INTO student_payment (billing_id, amount, payment_date, sibling_discount, student_id)
VALUES
  (1, 1000, '2024-11-20', 10, 1),
  (2, 1200, '2024-11-21', 0, 2),
  (3, 1100, '2024-11-22', 5, 3),
  (4, 1050, '2024-11-23', 0, 4);

INSERT INTO ensembles (ensemble_id, instructor_id, student_id, max_students, min_students, instrument_type, lesson_type, skill_level, genre_id)
VALUES
  (1, 1, 1, 5, 3, 'Piano', 'Group', 'Beginner', 1),
  (2, 2, 2, 6, 4, 'Guitar', 'Group', 'Intermediate', 2);

INSERT INTO individual_lesson (individual_lesson_id, instructor_id, student_id, instrument_type, lesson_type, skill_level, genre)
VALUES
  (1, 3, 3, 'Violin', 'Individual', 'Advanced', 'Classical'),
  (2, 4, 4, 'Drums', 'Individual', 'Beginner', 'Rock');

INSERT INTO group_lessons (group_lesson_id, instructor_id, student_id, max_students, min_students, instrument_type, lesson_type, skill_level, genre)
VALUES
  (1, 1, 1, 5, 3, 'Piano', 'Group', 'Beginner', 'Pop'),
  (2, 2, 2, 6, 4, 'Guitar', 'Group', 'Intermediate', 'Jazz');

INSERT INTO renting_instrument (rental_id, student_id, instrument_id, rental_start_date, rental_end_date, stock_id)
VALUES
  (1, 1, 1, '2024-11-01', '2024-11-30', 1),
  (2, 2, 2, '2024-11-05', '2024-12-05', 2);

INSERT INTO instructor_salary (instructor_id, amount, work_time)
VALUES
  (1, 50000, 40),
  (2, 45000, 35),
  (3, 48000, 38),
  (4, 47000, 36);

INSERT INTO price_lesson_layout (price_id, price, skill_level, lesson_type)
VALUES
  (1, 300, 'Beginner', 'Individual'),
  (2, 350, 'Intermediate', 'Group'),
  (3, 400, 'Advanced', 'Individual'),
  (4, 250, 'Beginner', 'Group');

INSERT INTO booking (time_slot_id, instructor_id, price_id, scheduled_time)
VALUES
  (1, 1, 1, '2024-11-25'),
  (2, 2, 2, '2024-11-26');

INSERT INTO price_lesson_layout_ensembles (price_id, ensemble_id, instructor_id, student_id)
VALUES
  (1, 1, 1, 1),
  (2, 2, 2, 2);

INSERT INTO price_lesson_layout_individual_lesson (price_id, individual_lesson_id, instructor_id, student_id)
VALUES
  (1, 1, 3, 3),
  (2, 2, 4, 4);

INSERT INTO price_lesson_layout_group_lessons (price_id, group_lesson_id, instructor_id, student_id)
VALUES
  (1, 1, 1, 1),
  (2, 2, 2, 2);
