package crm.gobelins.darkunicorn.signals
{
	import crm.gobelins.darkunicorn.services.UserVo;
	
	import org.osflash.signals.Signal;
	
	public class FbLoggedInSignal extends Signal
	{
		public function FbLoggedInSignal()
		{
			super(UserVo);
		}
	}
}