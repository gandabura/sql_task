-- 
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

-- Started on 2017-11-05 23:48:19 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 16478)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category (
    id_category integer NOT NULL,
    name_of_category character varying NOT NULL
);


ALTER TABLE category OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16470)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE country (
    id_country integer NOT NULL,
    name_of_country character varying NOT NULL
);


ALTER TABLE country OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16447)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customer (
    id_customer integer NOT NULL,
    last_name character varying(30) NOT NULL,
    first_name character varying(15) NOT NULL,
    adress character varying(40) NOT NULL,
    city character varying(20) NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE customer OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16441)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE employee (
    id_employee integer NOT NULL,
    last_name character varying(30) NOT NULL,
    first_name character varying NOT NULL,
    date_of_birth date NOT NULL,
    date_of_hire date NOT NULL,
    adress character varying(40) NOT NULL,
    city character varying(30) NOT NULL,
    notes character varying,
    hometown character varying(20) NOT NULL,
    chief_id integer,
    country_id integer
);


ALTER TABLE employee OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16450)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "order" (
    id_order integer NOT NULL,
    customer_id integer,
    employee_id integer,
    date_of_creation date NOT NULL
);


ALTER TABLE "order" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16486)
-- Name: orders_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE orders_products (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL
);


ALTER TABLE orders_products OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16444)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE product (
    id_product integer NOT NULL,
    category_id integer,
    name_of_product character varying(30) NOT NULL,
    price integer NOT NULL
);


ALTER TABLE product OWNER TO postgres;

--
-- TOC entry 3160 (class 0 OID 16478)
-- Dependencies: 201
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY category (id_category, name_of_category) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 16470)
-- Dependencies: 200
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY country (id_country, name_of_country) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 16447)
-- Dependencies: 198
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer (id_customer, last_name, first_name, adress, city, country_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 16441)
-- Dependencies: 196
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employee (id_employee, last_name, first_name, date_of_birth, date_of_hire, adress, city, notes, hometown, chief_id, country_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 16450)
-- Dependencies: 199
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "order" (id_order, customer_id, employee_id, date_of_creation) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 16486)
-- Dependencies: 202
-- Data for Name: orders_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orders_products (order_id, product_id, quantity, price) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 16444)
-- Dependencies: 197
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product (id_product, category_id, name_of_product, price) FROM stdin;
\.


--
-- TOC entry 3025 (class 2606 OID 16490)
-- Name: category categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id_category);


--
-- TOC entry 3023 (class 2606 OID 16477)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id_country);


--
-- TOC entry 3019 (class 2606 OID 16462)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id_customer);


--
-- TOC entry 3015 (class 2606 OID 16457)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id_employee);


--
-- TOC entry 3021 (class 2606 OID 16464)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id_order);


--
-- TOC entry 3017 (class 2606 OID 16469)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id_product);


--
-- TOC entry 3028 (class 2606 OID 16526)
-- Name: product category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product
    ADD CONSTRAINT category_id FOREIGN KEY (category_id) REFERENCES category(id_category);


--
-- TOC entry 3026 (class 2606 OID 16496)
-- Name: employee chief_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT chief_id FOREIGN KEY (chief_id) REFERENCES employee(id_employee);


--
-- TOC entry 3029 (class 2606 OID 16491)
-- Name: customer country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT country_id FOREIGN KEY (country_id) REFERENCES country(id_country);


--
-- TOC entry 3027 (class 2606 OID 16501)
-- Name: employee country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT country_id FOREIGN KEY (country_id) REFERENCES country(id_country);


--
-- TOC entry 3030 (class 2606 OID 16506)
-- Name: order customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT customer_id FOREIGN KEY (customer_id) REFERENCES customer(id_customer);


--
-- TOC entry 3031 (class 2606 OID 16511)
-- Name: order employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT employee_id FOREIGN KEY (employee_id) REFERENCES employee(id_employee);


--
-- TOC entry 3032 (class 2606 OID 16516)
-- Name: orders_products order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders_products
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES "order"(id_order);


--
-- TOC entry 3033 (class 2606 OID 16521)
-- Name: orders_products product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders_products
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES product(id_product);


-- Completed on 2017-11-05 23:48:19 EET

--
-- PostgreSQL database dump complete
--

