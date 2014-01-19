package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.*;
	import flash.media.Camera;
	import flash.media.Video;
	
	public class CameraControl extends Sprite
	{
		private var video:Video;
		
		public function CameraControl()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
				
			var camera:Camera = Camera.getCamera();
			
			if (camera != null) {
				camera.addEventListener(ActivityEvent.ACTIVITY, activityHandler);
				video = new Video(camera.width * 2, camera.height * 2);
				video.attachCamera(camera);
				addChild(video);
			} else {
				trace("You need a camera.");
			}
		}
		private function activityHandler(event:ActivityEvent):void {
			trace("activityHandler: " + event);
		}	
	}
}