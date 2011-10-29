package uk.co.betadesigns.extension.nativealert
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.StatusEvent;
    import flash.external.ExtensionContext;

    public class NativeAlert extends EventDispatcher
    {
        //---------------------------------------------------------------------
        //
        // Constants
        //
        //---------------------------------------------------------------------

        private static const EXTENSION_ID : String = "uk.co.betadesigns.extension.nativealert.NativeAlert";


        private var context : ExtensionContext;

        public function NativeAlert()
        {
            context = ExtensionContext.createExtensionContext( EXTENSION_ID, null );
        }

        public function showAlertWithTitleAndMessage( title : String, message : String,
            closeLabel : String, otherLabels : String = "" ) : void
        {
            context.addEventListener( StatusEvent.STATUS, onAlertHandler );
            context.call( "showAlertWithTitleAndMessage", title, message, closeLabel, otherLabels );
        }

        private function onAlertHandler( event : StatusEvent ) : void
        {
            if( event.code == "ALERT_CLOSED" )
            {
                dispatchEvent( new NativeAlertEvent( event.level ));
                context.removeEventListener( StatusEvent.STATUS, onAlertHandler );
            }
        }
    }
}
