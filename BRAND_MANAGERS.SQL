CREATE TABLE BRAND_MANAGERS (
   empl_id int FOREIGN KEY REFERENCES Employees(empl_id),
   promo_id int FOREIGN KEY REFERENCES Promotions(promo_id)
);