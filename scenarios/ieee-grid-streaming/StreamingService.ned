import artery.application.ItsG5Service;

simple StreamingService like ItsG5Service
{
	parameters:
		int byteLength = default(1350);		
		@signal[speed](type="double");
		@statistic[speed](source="speed"; record=vector?);
		double warningRadius @unit(m) = default(100 m);
        	double warningDuration @unit(s) = default(10 s);

}
