-- Table: public.homework

-- DROP TABLE IF EXISTS public.homework;

CREATE TABLE IF NOT EXISTS public.homework
(
    "id " integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "name " text COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT homework_pkey PRIMARY KEY ("id ")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.homework
    OWNER to postgres;


-- Table: public.lesson

-- DROP TABLE IF EXISTS public.lesson;

CREATE TABLE IF NOT EXISTS public.lesson
(
    "id " integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "name " text COLLATE pg_catalog."default" NOT NULL,
    update_at date NOT NULL,
    homeword_id integer NOT NULL,
    CONSTRAINT lesson_pkey PRIMARY KEY ("id "),
    CONSTRAINT homeword_id_unique UNIQUE (homeword_id),
    CONSTRAINT homework_fkey FOREIGN KEY (homeword_id)
        REFERENCES public.homework ("id ") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.lesson
    OWNER to postgres;


-- Table: public.schedule

-- DROP TABLE IF EXISTS public.schedule;

CREATE TABLE IF NOT EXISTS public.schedule
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "name " text COLLATE pg_catalog."default" NOT NULL,
    update_at date NOT NULL,
    CONSTRAINT schedule_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.schedule
    OWNER to postgres;


-- Table: public.schedule_lesson

-- DROP TABLE IF EXISTS public.schedule_lesson;

CREATE TABLE IF NOT EXISTS public.schedule_lesson
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    schedule_id integer NOT NULL,
    lesson_id integer NOT NULL,
    CONSTRAINT schedule_lesson_pkey PRIMARY KEY (id),
    CONSTRAINT lesson_id_fk FOREIGN KEY (lesson_id)
        REFERENCES public.lesson ("id ") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT schedule_id_fk FOREIGN KEY (schedule_id)
        REFERENCES public.schedule (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.schedule_lesson
    OWNER to postgres;