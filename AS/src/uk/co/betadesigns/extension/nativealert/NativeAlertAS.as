package uk.co.betadesigns.extension.nativealert
{
    import flash.display.DisplayObjectContainer;

    import mx.core.FlexGlobals;

    import spark.components.SkinnablePopUpContainer;

    public class NativeAlertAS extends SkinnablePopUpContainer implements INativeAlert
    {
        [Bindable]
        public var closeButtonLabel : String;

        [Bindable]
        public var title : String;

        [Bindable]
        public var message : String;

        public function showAlertWithTitleAndMessage( title : String, message : String,
            closeLabel : String, otherLabels : String = "" ) : void
        {
            this.title = title;
            this.message = message;
            this.closeButtonLabel = closeLabel;

            open( FlexGlobals.topLevelApplication as DisplayObjectContainer );
        }
    }
}
