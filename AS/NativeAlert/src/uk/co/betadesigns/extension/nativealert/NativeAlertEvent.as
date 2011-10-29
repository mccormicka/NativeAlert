package uk.co.betadesigns.extension.nativealert
{
    import flash.events.Event;

    /**
     * This event is dipatched from our NativeAlert class whenever the user
     * closes the devices alert box. It contiains one property that represents
     * the index of the button that was selected to close the Alert.
     */
    public class NativeAlertEvent extends Event
    {
        //---------------------------------------------------------------------
        //
        // Constants.
        //
        //---------------------------------------------------------------------
        //-----------------------------
        // Event
        //-----------------------------
        public static const ALERT_CLOSE_EVENT : String = "ALERT_CLOSED";

        //---------------------------------------------------------------------
        //
        // Public Properties.
        //
        //---------------------------------------------------------------------

        //-----------------------------
        // Level
        //-----------------------------

        private var _index : String;

        /**
         * The index of the button that was selected to close the device Alert box.
         */
        public function get index() : String
        {
            return _index;
        }

        //---------------------------------------------------------------------
        //
        // Public Methods.
        //
        //---------------------------------------------------------------------

        /**
         * The index of the button that was selected to close the device Alert box.
         * @param level
         *
         */
        public function NativeAlertEvent( index : String )
        {
            _index = index;
            super( ALERT_CLOSE_EVENT );
        }

        override public function clone() : Event
        {
            return new NativeAlertEvent( index );
        }
    }
}
