DROP TABLE IF EXISTS part;
CREATE TABLE part(
  id INT(10) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  needed BOOLEAN DEFAULT FALSE,
  count int(10) NOT NULL
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = utf8;

INSERT INTO part(name, needed, count) VALUES ('Операционная система на CD', false, 1);
INSERT INTO part(name, needed, count) VALUES ('Фото вашего компьютера в рамочке', false, 1);
INSERT INTO part(name, needed, count) VALUES ('Очки виртуальной реальности', false, 3);
INSERT INTO part(name, needed, count) VALUES ('Автограф Билла Гейтса ', false, 17);
INSERT INTO part(name, needed, count) VALUES ('Материнская плата', true, 4);
INSERT INTO part(name, needed, count) VALUES ('Монитор', true, 0);
INSERT INTO part(name, needed, count) VALUES ('Корпус', true, 3);
INSERT INTO part(name, needed, count) VALUES ('Блок питания', true, 4);
INSERT INTO part(name, needed, count) VALUES ('Видеокарта', true, 1);
INSERT INTO part(name, needed, count) VALUES ('Звуковаякарта', true, 6);
INSERT INTO part(name, needed, count) VALUES ('Мышка', true, 2);
INSERT INTO part(name, needed, count) VALUES ('Клавиатура', true, 4);
INSERT INTO part(name, needed, count) VALUES ('Оперативная память', true, 12);
INSERT INTO part(name, needed, count) VALUES ('Коврик для мышки', false, 13);
INSERT INTO part(name, needed, count) VALUES ('Колонки звуковые', false, 1);
INSERT INTO part(name, needed, count) VALUES ('USB подогреватель для кружки', false, 2);
INSERT INTO part(name, needed, count) VALUES ('HDD 500GB', true, 7);
INSERT INTO part(name, needed, count) VALUES ('Процессор', true, 6);
INSERT INTO part(name, needed, count) VALUES ('Подсветка для клавиатуры', false, 8);
INSERT INTO part(name, needed, count) VALUES ('Наушники', false, 12);
INSERT INTO part(name, needed, count) VALUES ('Микрофон', false, 9);
INSERT INTO part(name, needed, count) VALUES ('Web Камера', false, 4);
INSERT INTO part(name, needed, count) VALUES ('WiFi адаптер', false, 71);
INSERT INTO part(name, needed, count) VALUES ('Инструкция для чайников', false, 7);
INSERT INTO part(name, needed, count) VALUES ('Шапочка для монитора', false, 112);
INSERT INTO part(name, needed, count) VALUES ('Карандашь', false, 80);
INSERT INTO part(name, needed, count) VALUES ('Жевачка', false, 30);
INSERT INTO part(name, needed, count) VALUES ('Джойстик игровой', false, 3);
INSERT INTO part(name, needed, count) VALUES ('Компьютерное кресло', false, 16);
INSERT INTO part(name, needed, count) VALUES ('Чернила для принетра', false, 1);
