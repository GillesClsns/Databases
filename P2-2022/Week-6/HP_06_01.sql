CREATE TABLE countries -- DONE
(
    country_code VARCHAR(3) UNIQUE PRIMARY KEY,
    country_name VARCHAR(50),
    tel_code     VARCHAR(4)
);

CREATE TABLE parks
(
    code         VARCHAR(2) UNIQUE CHECK (code = UPPER(code)) PRIMARY KEY,
    park_name    VARCHAR(15),
    sport        VARCHAR(9),
    country_code VARCHAR(3)
);

CREATE TABLE parkattractions
(
    park_code       VARCHAR(2) UNIQUE CHECK (park_code = UPPER(park_code)),
    attraction_code NUMERIC(4) UNIQUE,
    PRIMARY KEY (park_code, attraction_code)
);

CREATE TABLE parkattractiontypes
(
    attraction_code NUMERIC(4) PRIMARY KEY,
    description     VARCHAR(100)
);

CREATE TABLE cottagetypes
(
    park_code    VARCHAR(2),
    typeno       VARCHAR(4),
    no_bedrooms  NUMERIC(1),
    no_persons   NUMERIC(2),
    no_bathrooms NUMERIC(1),
    cot          VARCHAR(1),
    comments     VARCHAR(30),
    wifi         VARCHAR(1),
    surface      NUMERIC(3),
    PRIMARY KEY (park_code, typeno)
);

CREATE TABLE cottages
(
    park_code  VARCHAR(2) UNIQUE CHECK (park_code = UPPER(park_code)),
    typeno     VARCHAR(4) UNIQUE,
    houseno    CHAR(3) UNIQUE,
    corner     VARCHAR(1),
    central    VARCHAR(1),
    pet        VARCHAR(1),
    quiet      VARCHAR(1),
    playground VARCHAR(1),
    beach      VARCHAR(1),
    PRIMARY KEY (park_code, typeno, houseno)
);

CREATE TABLE promotions
(
    promo_code VARCHAR(9) UNIQUE PRIMARY KEY,
    percentage NUMERIC(3, 1),
    start_date DATE,
    end_date   DATE,
    park_code  VARCHAR(2) UNIQUE CHECK (park_code = UPPER(park_code)),
    typeno     VARCHAR(4) UNIQUE
);


CREATE TABLE payments
(
    paymentno      NUMERIC(9) PRIMARY KEY,
    resno          NUMERIC(3) REFERENCES reservations(resno),
    tano           NUMERIC(2) REFERENCES reservations(tano),
    payment_date   DATE,
    amount         NUMERIC(8, 2),
    payment_method VARCHAR(1)
);

CREATE TABLE seasons
(
    code        NUMERIC(2) UNIQUE PRIMARY KEY,
    descirption VARCHAR(30),
    start_date  DATE,
    end_date    DATE
);

CREATE TABLE cottype_prices
(
    park_code       VARCHAR(2) UNIQUE CHECK (park_code = UPPER(park_code)),
    typeno          VARCHAR(4) UNIQUE CHECK (typeno = UPPER(typeno)),
    season_code     NUMERIC(2),
    price_weekend   NUMERIC(5),
    price_midweek   NUMERIC(5),
    price_extra_day NUMERIC(5),
    PRIMARY KEY (park_code, typeno, season_code)
);

CREATE TABLE clients
(
    clientno   VARCHAR(5) PRIMARY KEY,
    last_name  VARCHAR(25) CHECK (last_name = UPPER(last_name)),
    first_name VARCHAR(25) CHECK (first_name = UPPER(first_name)),
    street     VARCHAR(40) CHECK (first_name = UPPER(first_name)),
    houseno    VARCHAR(5),
    postcode   VARCHAR(6),
    city       VARCHAR(20) CHECK (first_name = UPPER(first_name)),
    status     VARCHAR(10)
);

CREATE TABLE travelagencies
(
    tano     CHAR(2) PRIMARY KEY,
    ta_name  VARCHAR(10) CHECK (ta_name = UPPER(ta_name)),
    street   VARCHAR(40) CHECK (ta_name = UPPER(ta_name)),
    houseno  VARCHAR(5),
    postcode VARCHAR(6),
    city     VARCHAR(20) CHECK (city = UPPER(city))
);

CREATE TABLE reservations
(
    resno        NUMERIC(4),
    tano         NUMERIC(2) REFERENCES travelagencies(tano),
    clientno     varchar(5) REFERENCES clients(clientno),
    park_code    varchar(2) CHECK (park_code = upper(park_code)),
    typeno       varchar(5) CHECK (typeno = upper(typeno)),
    houseno      numeric(3),
    booking_date date,
    start_date   date,
    end_date     date,
    reser_code   numeric(1),
    status       varchar(6) check ((status)::text = ANY
                                   ((ARRAY ['OPEN'::character varying, 'PAID'::character varying, 'CLOSED'::character varying])::text[])),
    promo_code   varchar(9) check ((park_code)::text = UPPER(park_code)::text)
);


