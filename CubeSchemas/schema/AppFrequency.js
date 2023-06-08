cube('AppFrequency',{
	sql: `select patient_master_id,created_at from appointment_trackings where apmnt_status='Completed'`,

	measures:{
		count:{
			type:`count`,
		}
	},

	dimensions:{
		created_at:{
			sql:`created_at`,
			type:`time`
		},
		Patient_id:{
			sql:`patient_master_id`,
			type:`number`
		}
	},
      dataSource: `default`
})


cube(`Outerquery`, {
    sql: `select * from ${Subquery.count}`,

    preAggregations: {
        // Pre-Aggregations definitions go here
        // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
      },
      
      joins: {
        
      },
      
      measures: {
        count: {
          type: `count`,
        }
      },
      
      dimensions: {
      },
      dataSource: `default`
});