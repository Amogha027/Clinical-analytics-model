cube(`Agetable`, {
	sql: `select DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),dob)), '%Y') 
	  + 0 AS age , created_at from patient_masters`,
	preAggregations: {// Pre-Aggregations definitions go here
	  // Learn more here: https://cube.dev/docs/caching/pre-aggregations/getting-started
  
	  main: {
		measures: [Agetable.count],
		dimensions: [Agetable.Agegroup]
	  }
	},
	joins: {},
	measures: {
	  count: {
		type: `count`
	  }
	},
	dimensions: {
	  Age: {
		sql: `age`,
		type: `number`
	  },
	  createdAt: {
		sql: `created_at`,
		type: `time`
	  },
	  Agegroup: {
		type: `string`,
		case: {
		  when: [{
			sql: `${CUBE}.Age < 18`,
			label: `0-18`
		  }, {
			sql: `${CUBE}.Age < 45 AND ${CUBE}.Age >=18 `,
			label: `18-45`
		  }, {
			sql: `${CUBE}.Age >=45 AND ${CUBE}.Age < 60`,
			label: `45-60`
		  }],
		  else: {
			label: `>= 60`
		  }
		}
	  }
	},

	dataSource: `default`
  });