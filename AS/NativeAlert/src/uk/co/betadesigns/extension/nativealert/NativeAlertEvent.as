package uk.co.betadesigns.extension.nativealert
{
    import flash.events.Event;

    public class NativeAlertEvent extends Event
    {
        public static const ALERT_CLOSE_EVENT : String = "ALERT_CLOSED";

        private var _level : String;

        public function get level() : String
        {
            return _level;
        }

        public function NativeAlertEvent( level : String )
        {
            _level = level;
            super( ALERT_CLOSE_EVENT );
        }

        override public function clone() : Event
        {
            return new NativeAlertEvent( level );
        }
    }
}
