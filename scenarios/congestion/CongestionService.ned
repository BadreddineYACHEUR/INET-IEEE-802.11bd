import artery.application.ItsG5Service;

simple CongestionService like ItsG5Service
{
	parameters:
		int byteLength = default(1350);
		@signal[speed](type="double");
		@statistic[speed](source="speed"; record=vector?);

}
