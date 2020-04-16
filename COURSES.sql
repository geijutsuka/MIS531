CREATE TABLE COURSES (
  course_id   INT   NOT NULL UNIQUE,
  course_name NUMBER,
  course_description NUMBER,
  course_cost NUMBER,
  group_id int FOREIGN KEY REFERENCES PRODUCT_GROUPS(group_id)
  PRIMARY KEY(course_id)
);