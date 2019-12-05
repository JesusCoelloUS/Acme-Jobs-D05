
    create table `administrator` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `announcement` (
       `id` integer not null,
        `version` integer not null,
        `moment` datetime(6),
        `more_info` varchar(255),
        `text` varchar(255),
        `title` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `anonymous` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `application` (
       `id` integer not null,
        `version` integer not null,
        `creation_moment` datetime(6),
        `qualifications` varchar(255),
        `reference` varchar(255),
        `skills` varchar(255),
        `statement` varchar(255),
        `status` varchar(255),
        `job_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `audit_record` (
       `id` integer not null,
        `version` integer not null,
        `body` varchar(255),
        `creation_moment` datetime(6),
        `status` varchar(255),
        `title` varchar(255),
        `job_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `auditor` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        `firm` varchar(255),
        `responsability_statement` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `auditor_audit_record` (
       `auditor_id` integer not null,
        `audit_records_id` integer not null
    ) engine=InnoDB;

    create table `authenticated` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `bulletin` (
       `id` integer not null,
        `version` integer not null,
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `challenge` (
       `id` integer not null,
        `version` integer not null,
        `bronze_goal` varchar(255),
        `bronze_reward` integer,
        `deadline` datetime(6),
        `description` varchar(255),
        `gold_goal` varchar(255),
        `gold_reward` integer,
        `silver_goal` varchar(255),
        `silver_reward` integer,
        `title` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `company_record` (
       `id` integer not null,
        `version` integer not null,
        `ceo` varchar(255),
        `company` varchar(255),
        `description` varchar(255),
        `email` varchar(255),
        `phone` varchar(255),
        `sector` varchar(255),
        `stars` integer,
        `website` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `configuration` (
       `id` integer not null,
        `version` integer not null,
        `spam_words` varchar(255),
        `threshold` double precision,
        primary key (`id`)
    ) engine=InnoDB;

    create table `consumer` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        `company` varchar(255),
        `sector` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `duty` (
       `id` integer not null,
        `version` integer not null,
        `description` varchar(255),
        `percentage` double precision,
        `title` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `employer` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        `company` varchar(255),
        `sector` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `employer_job` (
       `employer_id` integer not null,
        `jobs_id` integer not null
    ) engine=InnoDB;

    create table `investor_record` (
       `id` integer not null,
        `version` integer not null,
        `investor` varchar(255),
        `sector` varchar(255),
        `stars` integer,
        `statement` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `job` (
       `id` integer not null,
        `version` integer not null,
        `deadline` datetime(6),
        `description` varchar(255),
        `more_info` varchar(255),
        `reference` varchar(255),
        `salary_amount` double precision,
        `salary_currency` varchar(255),
        `status` varchar(255),
        `title` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `job_duty` (
       `job_id` integer not null,
        `duties_id` integer not null
    ) engine=InnoDB;

    create table `offer` (
       `id` integer not null,
        `version` integer not null,
        `creation_moment` datetime(6),
        `deadline` datetime(6),
        `max_money` integer,
        `min_money` integer,
        `text` varchar(255),
        `ticker` varchar(255),
        `title` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `provider` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        `company` varchar(255),
        `sector` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `request` (
       `id` integer not null,
        `version` integer not null,
        `creation_moment` datetime(6),
        `deadline` datetime(6),
        `reward` integer,
        `text` varchar(255),
        `ticker` varchar(255),
        `title` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `shout` (
       `id` integer not null,
        `version` integer not null,
        `author` varchar(255),
        `moment` datetime(6),
        `text` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `thread` (
       `id` integer not null,
        `version` integer not null,
        `moment` datetime(6),
        `title` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `thread_message` (
       `id` integer not null,
        `version` integer not null,
        `body` varchar(255),
        `creation_moment` datetime(6),
        `tags` varchar(255),
        `title` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `thread_authenticated` (
       `thread_id` integer not null,
        `users_id` integer not null
    ) engine=InnoDB;

    create table `thread_thread_message` (
       `thread_id` integer not null,
        `thread_messages_id` integer not null
    ) engine=InnoDB;

    create table `user_account` (
       `id` integer not null,
        `version` integer not null,
        `enabled` bit not null,
        `identity_email` varchar(255),
        `identity_name` varchar(255),
        `identity_surname` varchar(255),
        `password` varchar(255),
        `username` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `worker` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        `qualifications` varchar(255),
        `skills` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `worker_application` (
       `worker_id` integer not null,
        `applications_id` integer not null
    ) engine=InnoDB;

    create table `hibernate_sequence` (
       `next_val` bigint
    ) engine=InnoDB;

    insert into `hibernate_sequence` values ( 1 );

    alter table `application` 
       add constraint UK_ct7r18vvxl5g4c4k7aefpa4do unique (`reference`);

    alter table `auditor_audit_record` 
       add constraint UK_f4solktf7yvt2grylyfa3rgjo unique (`audit_records_id`);

    alter table `employer_job` 
       add constraint UK_k7bs8pqirrx2i95s7xki2ei22 unique (`jobs_id`);

    alter table `job` 
       add constraint UK_7jmfdvs0b0jx7i33qxgv22h7b unique (`reference`);

    alter table `job_duty` 
       add constraint UK_8l5irvacqjnfw08o1x5v1y97v unique (`duties_id`);

    alter table `offer` 
       add constraint UK_iex7e8fs0fh89yxpcnm1orjkm unique (`ticker`);

    alter table `request` 
       add constraint UK_9mxq3powq8tqctclj0fbi2nih unique (`ticker`);

    alter table `thread_thread_message` 
       add constraint UK_l4g6jmhtrwg25unn2s6e06jxp unique (`thread_messages_id`);

    alter table `user_account` 
       add constraint UK_castjbvpeeus0r8lbpehiu0e4 unique (`username`);

    alter table `worker_application` 
       add constraint UK_buhx0gequyp0a2vmiwr0g90sw unique (`applications_id`);

    alter table `administrator` 
       add constraint FK_2a5vcjo3stlfcwadosjfq49l1 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `anonymous` 
       add constraint FK_6lnbc6fo3om54vugoh8icg78m 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `application` 
       add constraint `FKoa6p4s2oyy7tf80xwc4r04vh6` 
       foreign key (`job_id`) 
       references `job` (`id`);

    alter table `audit_record` 
       add constraint `FKlbvbyimxf6pxvbhkdd4vfhlnd` 
       foreign key (`job_id`) 
       references `job` (`id`);

    alter table `auditor` 
       add constraint FK_clqcq9lyspxdxcp6o4f3vkelj 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `auditor_audit_record` 
       add constraint `FKt6cgpxno7j90q5jkrue6t6432` 
       foreign key (`audit_records_id`) 
       references `audit_record` (`id`);

    alter table `auditor_audit_record` 
       add constraint `FKi28w85w2g1nhcmvactdguahqq` 
       foreign key (`auditor_id`) 
       references `auditor` (`id`);

    alter table `authenticated` 
       add constraint FK_h52w0f3wjoi68b63wv9vwon57 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `consumer` 
       add constraint FK_6cyha9f1wpj0dpbxrrjddrqed 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `employer` 
       add constraint FK_na4dfobmeuxkwf6p75abmb2tr 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `employer_job` 
       add constraint `FK9021shkjx8mv4go6ujdjt94q4` 
       foreign key (`jobs_id`) 
       references `job` (`id`);

    alter table `employer_job` 
       add constraint `FKtr91uryf2mp5ehddqni6sy8qm` 
       foreign key (`employer_id`) 
       references `employer` (`id`);

    alter table `job_duty` 
       add constraint `FK9uwg2js056tp1m971wy3xesua` 
       foreign key (`duties_id`) 
       references `duty` (`id`);

    alter table `job_duty` 
       add constraint `FKrxu09f16kvcibraroor41bpmr` 
       foreign key (`job_id`) 
       references `job` (`id`);

    alter table `provider` 
       add constraint FK_b1gwnjqm6ggy9yuiqm0o4rlmd 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `thread_authenticated` 
       add constraint `FKkuamwlt147dsxim98bfhh4dsr` 
       foreign key (`users_id`) 
       references `authenticated` (`id`);

    alter table `thread_authenticated` 
       add constraint `FKjsja3s5mr66x5nxm9dd8kut3r` 
       foreign key (`thread_id`) 
       references `thread` (`id`);

    alter table `thread_thread_message` 
       add constraint `FK80pog75t7l0550qt5c9qlgaw3` 
       foreign key (`thread_messages_id`) 
       references `thread_message` (`id`);

    alter table `thread_thread_message` 
       add constraint `FK9u6sxds39e4hpi67jfi90a1r5` 
       foreign key (`thread_id`) 
       references `thread` (`id`);

    alter table `worker` 
       add constraint FK_l5q1f33vs2drypmbdhpdgwfv3 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `worker_application` 
       add constraint `FK9wsdvselu5eevkhrxub2ouvy2` 
       foreign key (`applications_id`) 
       references `application` (`id`);

    alter table `worker_application` 
       add constraint `FK5wwpk28fthtkfwwda7xa8vdtr` 
       foreign key (`worker_id`) 
       references `worker` (`id`);
