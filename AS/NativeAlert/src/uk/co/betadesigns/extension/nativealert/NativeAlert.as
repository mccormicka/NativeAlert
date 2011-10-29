package uk.co.betadesigns.extension.nativealert
{
    import flash.events.EventDispatcher;
    import flash.events.StatusEvent;
    import flash.external.ExtensionContext;

    /**
     * Simple NativeAlert extension that allows you to
     * Open device specific alerts and recieve information about
     * what button the user pressed to close the alert.
     */
    public class NativeAlert extends EventDispatcher
    {
        //---------------------------------------------------------------------
        //
        // Constants
        //
        //---------------------------------------------------------------------

        private static const EXTENSION_ID : String = "uk.co.betadesigns.extension.nativealert.NativeAlert";

        //---------------------------------------------------------------------
        //
        // Private Properties.
        //
        //---------------------------------------------------------------------

        private var context : ExtensionContext;

        //---------------------------------------------------------------------
        //
        // Public Methods.
        //
        //---------------------------------------------------------------------

        public function NativeAlert()
        {
            context = ExtensionContext.createExtensionContext( EXTENSION_ID, null );
        }

        /**
         * @param title Title to be displayed in the Alert.
         * @param message Message to be displayed in the Alert.
         * @param closeLabel Label for the close button.
         * @param otherLabels shoud be a comma separated sting of button labels.
         * for example "one,two,three"
         */
        public function showAlertWithTitleAndMessage( title : String, message : String,
            closeLabel : String, otherLabels : String = "" ) : void
        {
            context.addEventListener( StatusEvent.STATUS, onAlertHandler );
            context.call( "showAlertWithTitleAndMessage", title, message, closeLabel, otherLabels );
        }

        //---------------------------------------------------------------------
        //
        // Private Methods.
        //
        //---------------------------------------------------------------------

        /**
         * @private
         * When the Alert closes in the device we will redispatch the event
         * through ActionScript so that we can handle the user interaction.
         * The event will contain the index of the button that the user selected.
         */
        private function onAlertHandler( event : StatusEvent ) : void
        {
            if( event.code == NativeAlertEvent.ALERT_CLOSE_EVENT )
            {
                dispatchEvent( new NativeAlertEvent( event.level ));
                context.removeEventListener( StatusEvent.STATUS, onAlertHandler );
            }
        }
    }
}
