package crm.gobelins.darkunicorn.views
{
	import crm.gobelins.darkunicorn.services.ScoreService;
	import crm.gobelins.darkunicorn.signals.GotoFbSignal;
	import crm.gobelins.darkunicorn.signals.GotoGameSignal;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class HomeMediator extends Mediator
	{
		[Inject]
		public var view : HomeView;
		[Inject]
		public var play_sig : GotoGameSignal;
		[Inject]
		public var start_signal : GotoFbSignal;
		[Inject]
		public var score_serv : ScoreService;
		
		override public function onRegister() : void {
			view.btn_logout_signal.add(_onLogoutClicked);
			view.btn_play_signal.add(_onPlayClicked);
			view.btn_hof_signal.add(_onScoreClicked);
		}
		
		override public function onRemove() : void {
			view.btn_hof_signal.removeAll();
			view.btn_logout_signal.removeAll();
			view.btn_play_signal.removeAll();
		}
		
		protected function _onLogoutClicked():void
		{
			start_signal.dispatch();
		}
		
		protected function _onPlayClicked():void
		{
			play_sig.dispatch();
		}
		
		protected function _onScoreClicked():void
		{
			score_serv.getAllScores();
		}
	}
}