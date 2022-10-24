/**
 * 
 */
 
 
 // 월별 총 지출액
	var options = {
			   series: [
			      {
			         name: 'Actual',
			         data: [
			            {
			               x: '1월',
			               y: 1292,
			            },
			            {
			               x: '2월',
			               y: 4432,
			            },
			            {
			               x: '3월',
			               y: 5423,
			            },
			            {
			               x: '4월',
			               y: 6653,
			            },
			            {
			               x: '5월',
			               y: 8133,
			            },
			            {
			               x: '6월',
			               y: 7132,
			            },
			            {
			               x: '7월',
			               y: 7332,
			            },
			            {
			               x: '8월',
			               y: 9999,
			            },
			            			            {
			               x: '8월',
			               y: 9999,
			            },
			            			            {
			               x: '8월',
			               y: 9999,
			            },
			            
			         ]
			      }
			   ],
			   chart: {
			      height: 350,
			      type: 'bar',
			      toolbar: {
			        show: false
			        },
			   },
			   plotOptions: {
			      bar: {
			         columnWidth: '60%'
			      }
			   },
			   colors: ['#019591'],
			   dataLabels: {
			      enabled: false
			   },
			   legend: {
			      show: true,
			      showForSingleSeries: true,
			      markers: {
			         fillColors: ['#019591']
			      }
			   }
			};
    
    var chart = new ApexCharts(document.querySelector("#area-monthly"), options);
    chart.render();
    
    // 주별 지출액
 	var options1 = {
          series: [
		{
          name: '1주차',
          data: [5, 5, 10, 8, 7, 5, 4, null, null, null, 10, 10] // , 7, 8, 6, 9
        },
        {
          name: '2주차',
          data: [10, 15, null, 12, null, 10, 12, 15, null, null, 12, null] // , 14, null, null, null
        },
        {
          name: '3주차',
          data: [null, null, null, null, 3, 4, 1, 3, 4,  6,  7,  9] // , 5, null, null, null
        },
        {
          name: '4주차',
          data: [null, null, null, null, 3, 4, 1, 3, 4,  6,  7,  9] // , 5, null, null, null
        },
        {
          name: '5주차',
          data: [null, null, null, null, 3, 4, 1, 3, 4,  6,  7,  9] // , 5, null, null, null
        }
        ],
       		   chart: {
			      height: 350,
			      type: 'bar',
			      toolbar: {
			        show: false
			        },
			   },
			   plotOptions: {
			      bar: {
            horizontal: false,
            columnWidth: '85%',
            endingShape: 'rounded'
			      }
			   },
			   legend: {
			      show: true,
			      showForSingleSeries: false,
			      markers: {
			         fillColors: ['#019591']
			      }
			   },
        //labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
        labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        title: {
          text: 'Missing data (null values)'
        },
        xaxis: {
        },
        };

        var chart1 = new ApexCharts(document.querySelector("#area-weekly"), options1);
        chart1.render();
        
        
        // 결제방법별 결제횟수
        var options3 = {
          series: [{
          data: [400, 430, 448, 470]
        }],
          chart: {
          type: 'bar',
          height: 350,
          toolbar:{
			show:false
		  },
        },
        plotOptions: {
          bar: {
            borderRadius: 4,
            horizontal: true,
          }
        },
        dataLabels: {
          enabled: false
        },
        xaxis: {
          categories: ['South Korea', 'Canada', 'United Kingdom', 'Netherlands'],
        }
        };

        var chart3 = new ApexCharts(document.querySelector("#area-payTypeCnt"), options3);
        chart3.render();
      
      
      // 분기당 월평균
		var options4 = {
			   series: [
			      {
			         name: 'Actual',
			         data: [
			            {
			               x: '1월',
			               y: 1292,
			            },
			            {
			               x: '2월',
			               y: 4432,
			            },
			            {
			               x: '3월',
			               y: 5423,
			            },
			            {
			               x: '4월',
			               y: 6653,
			            },
			            
			         ]
			      }
			   ],
			   chart: {
			      height: 350,
			      type: 'bar',
			      toolbar: {
			        show: false
			        },
			   },
			   plotOptions: {
			      bar: {
			         columnWidth: '60%'
			      }
			   },
			   colors: ['#f6ef4d'],
			   dataLabels: {
			      enabled: false
			   },
			   legend: {
			      show: true,
			      showForSingleSeries: true,
			      markers: {
			         fillColors: ['#019591']
			      }
			   }
			};

        var chart4 = new ApexCharts(document.querySelector("#area-quarterly"), options4);
        chart4.render();
      
     
         
		$(document).ready(function(){
			// 월별 총 지출액
			$.ajax({
				url: "/analysis/drawGraph",
				data: {
					type : "monthly"
				},
				type: "post",
				dataType: "json",

  	           	success: function(resp) {
  	              	$("#area-monthly").empty();
  	              	//console.log(resp);
  	              	
	              	let xMonth = []; // x-axis
  	              	let yAmount = []; // y-axis
  	              	
  	              	for (let i = 0; i < resp.monthly.length; i++) {
  	                 	xMonth[i] = resp.monthly[i].MONTH+'월';
  	              		yAmount[i] = resp.monthly[i].AMOUNT;
  	              		
  	              		options.series[0].data[i].x = xMonth[i];
  	              		options.series[0].data[i].y = yAmount[i];
  	              	}
  	              	
  	              	options.series[0].name = "월별 지출";

  	              	var chartArea = new ApexCharts(document.querySelector('#area-monthly'), options);
  	              	chartArea.render(); 
  	           	},
  	           	error: function(request, status, error) {
  	              	console.log(request.status);
  	              	console.log(request.responseText);
  	              	console.log(request.error);
  	           	}
  		   	});
  		   	
  		    // 주별 지출액
			$.ajax({
				url: "/analysis/drawGraph",
				data: {
					type : "weekly"
				},
				type: "post",
				dataType: "json",

  	           	success: function(resp) {
  	              	$("#area-weekly").empty();
  	              	console.log(resp);
  	              	
	              	let xMonth = []; // x-axis
  	              	let yAmount = []; // y-axis
  	              	options1.title.text = "주별 지출액"
  	              	
  	              	for (let i = 0; i < resp.weekly.length; i++) {
						if(i === 0){
							xMonth[i] = resp.weekly[i].MONTH;							
						} else if(i > 0 && (resp.weekly[i-1].MONTH != resp.weekly[i].MONTH)){
							xMonth[i] = resp.weekly[i].MONTH;
						} else {
							xMonth[i] = null;
						}
						yAmount[i] = resp.weekly[i].AMOUNT;
						console.log('x축 : ' + xMonth[i]);
  	              		console.log('y축 : ' + yAmount[i]);
  	              		
  	              		// options1.series[i].data[i] = xMonth[i];
  	              		// options1.series[i].data = yAmount;
  	              		//console.log($.trim(options1.series.data[i]));
  	              	}
  	              	
				    var chart1 = new ApexCharts(document.querySelector("#area-weekly"), options1);
				    chart1.render();
  	           	},
  	           	error: function(request, status, error) {
  	              	console.log(request.status);
  	              	console.log(request.responseText);
  	              	console.log(request.error);
  	           	}
  		   	});
  		   	
  		   	
  		   // 소비카테고리 별 지출
			$.ajax({
				url: "/analysis/drawGraph",
				data: {
					type : "category"
				},
				type: "post",
				dataType: "json",

  	           	success: function(resp) {
  	              	//console.log(resp);
  	              	
  	              	let amount = [];
  	              	let labelsa = [];
  	              	let percent = [];
  	              	//options.title.text = "고객님의 소비카테고리 별 지출";
  	              	
  	              	for (let i = 0; i < resp.category.length-7; i++) {

  	                 	amount[i] = resp.category[i].AMOUNT;
  	                 	labelsa[i] = resp.category[i].NAME;
  	                 	percent[i] = resp.category[i].PERCENTAGE;
  	              	}
            
				  var data = [{
				  data: amount,
				  backgroundColor: [
				    "#4b77a9",
				    "#5f255f",
				    "#d21243",
				    "#B27200",
				    "#fd7e14"
				  ],
				  borderColor: "#fff"
				}];
				
				var options = {
				  tooltips: {
				    enabled: true
				  },
				  plugins: {
				    datalabels: {
				      formatter: (value, ctx) => {
				
				        let sum = ctx.dataset._meta[0].total;
				        let percentage = (value * 100 / sum).toFixed(2) + "%";
				        return percentage;
				
				
				      },
				      color: '#fff',
				      title: '고객님의 소비카테고리 별 지출',
				    }
				  }
				};
				
				
				var ctx = document.getElementById("pie-chart").getContext('2d');
				var myChart = new Chart(ctx, {
				  type: 'pie',
				  data: {
				  labels: labelsa,
				    datasets: data
				  },
				  options: options
				});
  	              	
  	           	},
  	           	error: function(request, status, error) {
  	              	console.log(request.status);
  	              	console.log(request.responseText);
  	              	console.log(request.error);
  	           	}
  		   	});
  		   	
  		   	// 다른사람 비교
  		   	//other-pie-chart
  		   	$.ajax({
				url: "/analysis/drawGraph",
				data: {
					type : "compareCategory"
				},
				type: "post",
				dataType: "json",

  	           	success: function(resp) {
  	              	//console.log(resp);
  	              	
  	              	let amount = [];
  	              	let labelsa = [];
  	              	let percent = [];
  	              	//options.title.text = "20대 소비카테고리 별 평균 지출";
  	              	
  	              	for (let i = 0; i < resp.category.length-10; i++) {

  	                 	amount[i] = resp.category[i].AMOUNT;
  	                 	labelsa[i] = resp.category[i].NAME;
  	                 	percent[i] = resp.category[i].PERCENTAGE;
  	              	}
            
				  var data = [{
				  data: amount,
				  backgroundColor: [
				    "#4b77a9",
				    "#5f255f",
				    "#d21243",
				    "#B27200",
				    "#fd7e14"
				  ],
				  borderColor: "#fff"
				}];
				
				var options = {
				  tooltips: {
				    enabled: true
				  },
				  plugins: {
				    datalabels: {
				      formatter: (value, ctx) => {
				
				        let sum = ctx.dataset._meta[1].total;
				        let percentage = (value * 100 / sum).toFixed(2) + "%";
				        return percentage;
				
				      },
				      color: '#fff',
				    }
				  }
				};
				
				
				var ctx1 = document.getElementById("other-pie-chart").getContext('2d');
				var myChart = new Chart(ctx1, {
				  type: 'pie',
				  data: {
				  labels: labelsa,
				    datasets: data
				  },
				  options: options
				});
  	              	
  	              	
  	           	},
  	           	error: function(request, status, error) {
  	              	console.log(request.status);
  	              	console.log(request.responseText);
  	              	console.log(request.error);
  	           	}
  		   	});
  		   	
  		   	// 결제방법별 결제횟수
  		   	$.ajax({
				url: "/analysis/drawGraph",
				data: {
					type : "payTypeCnt"
				},
				type: "post",
				dataType: "json",

  	           	success: function(resp) {
  	              	$("#area-payTypeCnt").empty();
  	              	console.log(resp);
  	              	
  	              	let CNT = [];
  	              	let BANK_ACCT_ALIAS = [];
  	              	for (let i = 0; i < resp.category.length; i++) {
						BANK_ACCT_ALIAS[i] = resp.category[i].BANK_ACCT_ALIAS;
						CNT[i] = resp.category[i].CNT;
  	              	}
  	              	options3.series[0].data = CNT;
  	              	options3.xaxis.categories = BANK_ACCT_ALIAS;
  	              	

			        var chart3 = new ApexCharts(document.querySelector("#area-payTypeCnt"), options3);
			        chart3.render();
  	           	},
  	           	error: function(request, status, error) {
  	              	console.log(request.status);
  	              	console.log(request.responseText);
  	              	console.log(request.error);
  	           	}
  		   	});
  		   	
  		   	// 분기당 월평균
  		   	$.ajax({
				url: "/analysis/drawGraph",
				data: {
					type : "quarterly"
				},
				type: "post",
				dataType: "json",

  	           	success: function(resp) {
  	              	$("#area-quarterly").empty();
  	              	let xMonth = []; // x-axis
  	              	let yAmount = []; // y-axis
  	              	
  	              	for (let i = 0; i < resp.category.length; i++) {
  	                 	xMonth[i] = resp.category[i].QUARTER;
  	              		yAmount[i] = resp.category[i].AVG_AMT;
  	              		
  	              		options4.series[0].data[i].x = xMonth[i];
  	              		options4.series[0].data[i].y = yAmount[i];
  	              	}
  	              	
  	              	options4.series[0].name = "분기당 월 평균 지출";

  		   	        var chart4 = new ApexCharts(document.querySelector("#area-quarterly"), options4);
        			chart4.render();
  	           	},
  	           	error: function(request, status, error) {
  	              	console.log(request.status);
  	              	console.log(request.responseText);
  	              	console.log(request.error);
  	           	}
  		   	});
  		  
  		   	
  		   	
  		   	
  		   	
        }); // ready
		   
	    
		