package crm.gobelins.darkunicorn.signals
{
	import crm.gobelins.darkunicorn.vo.UserVo;
	
	import org.osflash.signals.Signal;
	
	public class LocalLoggedInSignal extends Signal
	{
		public function LocalLoggedInSignal()
		{
			super(UserVo);
		}
	}
}