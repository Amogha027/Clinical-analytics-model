cube(`Visits`, {
    sql: `
    SELECT
      created_at as createdDatetime, 
      CASE 
        WHEN cnt = 1 THEN '1'
        WHEN cnt = 2 THEN '2'
        WHEN cnt = 3 THEN '3'
        WHEN cnt >= 4 THEN '4+'
      END AS numberOfVisits
    FROM (
      SELECT 
        patient_master_id, COUNT(*) AS cnt,created_at
      FROM ${AppFrequency.sql()} AS APP
      WHERE ${FILTER_PARAMS.Visits.created_at.filter('created_at')}
      GROUP BY patient_master_id
      ORDER BY cnt DESC
    ) AS ext
    GROUP BY createdDatetime, numberOfVisits
    ORDER BY numberOfVisits
    `,
    measures: {
        count: {
            sql: `1`,
            type: `sum`,
          },
    },
    dimensions: {
        Patient_id: {
            sql: `Patient_id`,
            type: `number`,
        },
        created_at: {
            sql: `createdDatetime`,
            type: `time`,
        },
    },
	dataSource:`default`
});