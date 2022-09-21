jQuery(document).ready(function () {
	jQuery("#add-event").submit(function () {
		alert("Submitted");
		var values = {};
		$.each($("#add-event").serializeArray(), function (i, field) {
			values[field.name] = field.value;
		});
		console.log(values);
	});
});

(function () {
	"use strict";
	// ------------------------------------------------------- //
	// Calendar
	// ------------------------------------------------------ //
	jQuery(function () {
		// page is ready
		
		jQuery("#calendarCash").fullCalendar({
			themeSystem: "bootstrap4",
			// emphasizes business hours
			businessHours: false,
			defaultView: "month",
			// event dragging & resizing
			editable: true,
			// header
			header: {
				left: "title",
				center: "month,agendaWeek,agendaDay",
				right: "today prev,next",
			},
			events: function(start, end, timezone, callback) {
				var events = [];

				// 캘린더 로드될 때 일별 지출,수입 출력
				$.ajax({
					url: "/cashbook/dayResult",
					type: "POST"
				})
					.done(function(data) {
						var list = JSON.parse(data);
						var title = '';

						list.forEach(function(item) {
							if (item.tranType === '+') title = '수입';
							else title = '지출';

							events.push(
								{
									title: title + ' ' + item.amountFm,
									description: item.amountFm,
									start: item.tranDt,
									end: item.tranDt,
									className: "fc-bg-default",
									icon: "circle",
								});
						});
						callback(events);
					});

			},
			displayEventTime: false,
			
			dayClick: function (date, jsEvent, view) {
				
				const aa = new Date(date);
				
				function padTo2Digits(num) {
					return num.toString().padStart(2, '0');
				}
				const year = aa.getFullYear();
				const month = padTo2Digits(aa.getMonth() + 1);
				const day = padTo2Digits(aa.getDate());
				
				const selectedDay = [year, month, day].join('.'); // 날짜 봐꿔보기!!!
				console.log(selectedDay); // 2022.09.01
				
				$("#selectedDay").val(selectedDay);
				
				// 거래내역 입력 모달 띄우고 DB에 저장
				jQuery("#modal-view-event-add").modal();
			},
			eventClick: function (event, jsEvent, view) {
				jQuery(".event-icon").html("<i class='fa fa-" + event.icon + "'></i>");
				jQuery(".event-title").html(event.title);
				jQuery(".event-body").html(event.description);
				jQuery(".eventUrl").attr("href", event.url);
				jQuery("#modal-view-event").modal();
			},
		});
		
	});
	
})(jQuery);


