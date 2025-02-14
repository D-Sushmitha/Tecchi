HOSPITAL MANAGEMENT:-

CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Patients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10),
    contact VARCHAR(50)
);
desc Patients;

CREATE TABLE Doctors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    specialization VARCHAR(50) NOT NULL
);
desc Doctors;

CREATE TABLE Appointments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(id)
);
desc Appointments;

INSERT INTO Patients (name, age, gender, contact) VALUES
('John Doe', 30, 'Male', '123-456-7890'),
('Jane Smith', 25, 'Female', '987-654-3210'),
('Alice Johnson', 40, 'Female', '456-789-1230'),
('Bob Brown', 35, 'Male', '789-123-4560');
select * from Patients;

INSERT INTO Doctors (name, specialization) VALUES
('Dr. Williams', 'Cardiology'),
('Dr. Johnson', 'Neurology'),
('Dr. Lee', 'Orthopedics'),
('Dr. Patel', 'Pediatrics');
select * from Doctors;

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2024-02-15', 'Scheduled'),
(2, 2, '2024-02-16', 'Completed'),
(3, 3, '2024-02-17', 'Scheduled'),
(4, 4, '2024-02-18', 'Cancelled'),
(1, 2, '2024-02-19', 'Completed');
select * from Appointments;

SELECT 
    Appointments.id, 
    Patients.name AS patient_name, 
    Doctors.name AS doctor_name, 
    Doctors.specialization, 
    Appointments.appointment_date, 
    Appointments.status
FROM Appointments
JOIN Patients ON Appointments.patient_id = Patients.id
JOIN Doctors ON Appointments.doctor_id = Doctors.id;

SELECT 
    Doctors.name AS doctor_name, 
    COUNT(Appointments.id) AS total_appointments
FROM Appointments
JOIN Doctors ON Appointments.doctor_id = Doctors.id
GROUP BY Doctors.name
ORDER BY total_appointments DESC;
