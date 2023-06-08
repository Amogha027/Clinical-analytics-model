cube(`RepeatVisits3`, {
	sql: `SELECT CASE 
	WHEN EXT.CNT =1 THEN '1'
	WHEN EXT.CNT =2 THEN '2'
	WHEN EXT.CNT =3 THEN '3'
	WHEN EXT.CNT >=4 THEN '4+'
 END  AS Vis,
		COUNT(*) AS count
 FROM ${RepeatVisits2.sql()} AS EXT 
 GROUP BY Vis`,
	preAggregations: {// Pre-Aggregations definitions go here
	  // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
	},
	joins: {
		RepeatVisits2:{
			relationship:`hasMany`,
			sql: `${CUBE}.Vis = ${RepeatVisits2.cnt}`,
		}
	},
	measures: {
	 
	},
	dimensions: {
		visits: {
			sql: `Vis`,
			type: `string`
		  },
		count:{
			sql:`count`,
			type:`number`
		}

	  }
	,
	dataSource:`default`
  });