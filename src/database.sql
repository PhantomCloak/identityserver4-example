-- auto-generated definition
create table identity_role
(
    role_id              text not null
        constraint identity_role_pk
            primary key,
    role_name            text,
    role_normalized_name text
);

alter table identity_role
    owner to db_admin;

create unique index identity_role_role_id_uindex
    on identity_role (role_id);

-- auto-generated definition
create table identity_user
(
    -- Only integer types can be auto increment
    id                  text default nextval('identity_user_user_id_seq'::regclass) not null
        constraint identity_user_pk
            primary key,
    username            text,
    password_hash       text,
    normalized_username text,
    email               text,
    normalized_email    text,
    email_verified      boolean,
    phone_number        text,
    phone_verified      boolean,
    security_stamp      text,
    two_factor_enabled  boolean,
    access_failed_count integer,
    lockout_enabled     boolean,
    lockout_end         date,
    created_on          date,
    deleted_on          date
);

alter table identity_user
    owner to db_admin;

create unique index identity_user_email_uindex
    on identity_user (email);

create unique index identity_user_user_id_uindex
    on identity_user (id);

create unique index identity_user_username_uindex
    on identity_user (username);

-- auto-generated definition
create table identity_user_claim
(
    id          serial not null
        constraint identity_user_claim_pk
            primary key,
    user_id     text
        constraint identity_user_claim_identity_user_user_id_fk
            references identity_user
            on delete cascade,
    claim_type  text,
    claim_value text
);

alter table identity_user_claim
    owner to db_admin;

create unique index identity_user_claim_id_uindex
    on identity_user_claim (id);

-- auto-generated definition
create table identity_user_role
(
    id      serial not null
        constraint identity_user_role_pk
            primary key,
    role_id text
        constraint identity_user_role_identity_role_role_id_fk
            references identity_role
            on delete cascade,
    user_id text
        constraint identity_user_role_identity_user_id_fk
            references identity_user
            on delete cascade
);

alter table identity_user_role
    owner to db_admin;

create unique index identity_user_role_id_uindex
    on identity_user_role (id);

-- auto-generated definition
create table identity_role_claim
(
    role_claim_id serial not null
        constraint identity_role_claims_pk
            primary key,
    claim_type    text,
    claim_value   text,
    role_id       text
        constraint identity_role_claims_identity_role_role_id_fk
            references identity_role
            on delete cascade
);

alter table identity_role_claim
    owner to db_admin;

create unique index identity_role_claims_role_claim_id_uindex
    on identity_role_claim (role_claim_id);


