
    alter table `administrator` 
       drop 
       foreign key FK_2a5vcjo3stlfcwadosjfq49l1;

    alter table `anonymous` 
       drop 
       foreign key FK_6lnbc6fo3om54vugoh8icg78m;

    alter table `application` 
       drop 
       foreign key `FKoa6p4s2oyy7tf80xwc4r04vh6`;

    alter table `audit_record` 
       drop 
       foreign key `FKlbvbyimxf6pxvbhkdd4vfhlnd`;

    alter table `auditor` 
       drop 
       foreign key FK_clqcq9lyspxdxcp6o4f3vkelj;

    alter table `auditor_audit_record` 
       drop 
       foreign key `FKt6cgpxno7j90q5jkrue6t6432`;

    alter table `auditor_audit_record` 
       drop 
       foreign key `FKi28w85w2g1nhcmvactdguahqq`;

    alter table `authenticated` 
       drop 
       foreign key FK_h52w0f3wjoi68b63wv9vwon57;

    alter table `consumer` 
       drop 
       foreign key FK_6cyha9f1wpj0dpbxrrjddrqed;

    alter table `employer` 
       drop 
       foreign key FK_na4dfobmeuxkwf6p75abmb2tr;

    alter table `employer_job` 
       drop 
       foreign key `FK9021shkjx8mv4go6ujdjt94q4`;

    alter table `employer_job` 
       drop 
       foreign key `FKtr91uryf2mp5ehddqni6sy8qm`;

    alter table `job_duty` 
       drop 
       foreign key `FK9uwg2js056tp1m971wy3xesua`;

    alter table `job_duty` 
       drop 
       foreign key `FKrxu09f16kvcibraroor41bpmr`;

    alter table `provider` 
       drop 
       foreign key FK_b1gwnjqm6ggy9yuiqm0o4rlmd;

    alter table `thread_authenticated` 
       drop 
       foreign key `FKkuamwlt147dsxim98bfhh4dsr`;

    alter table `thread_authenticated` 
       drop 
       foreign key `FKjsja3s5mr66x5nxm9dd8kut3r`;

    alter table `thread_thread_message` 
       drop 
       foreign key `FK80pog75t7l0550qt5c9qlgaw3`;

    alter table `thread_thread_message` 
       drop 
       foreign key `FK9u6sxds39e4hpi67jfi90a1r5`;

    alter table `worker` 
       drop 
       foreign key FK_l5q1f33vs2drypmbdhpdgwfv3;

    alter table `worker_application` 
       drop 
       foreign key `FK9wsdvselu5eevkhrxub2ouvy2`;

    alter table `worker_application` 
       drop 
       foreign key `FK5wwpk28fthtkfwwda7xa8vdtr`;

    drop table if exists `administrator`;

    drop table if exists `announcement`;

    drop table if exists `anonymous`;

    drop table if exists `application`;

    drop table if exists `audit_record`;

    drop table if exists `auditor`;

    drop table if exists `auditor_audit_record`;

    drop table if exists `authenticated`;

    drop table if exists `bulletin`;

    drop table if exists `challenge`;

    drop table if exists `company_record`;

    drop table if exists `configuration`;

    drop table if exists `consumer`;

    drop table if exists `duty`;

    drop table if exists `employer`;

    drop table if exists `employer_job`;

    drop table if exists `investor_record`;

    drop table if exists `job`;

    drop table if exists `job_duty`;

    drop table if exists `offer`;

    drop table if exists `provider`;

    drop table if exists `request`;

    drop table if exists `shout`;

    drop table if exists `thread`;

    drop table if exists `thread_message`;

    drop table if exists `thread_authenticated`;

    drop table if exists `thread_thread_message`;

    drop table if exists `user_account`;

    drop table if exists `worker`;

    drop table if exists `worker_application`;

    drop table if exists `hibernate_sequence`;
