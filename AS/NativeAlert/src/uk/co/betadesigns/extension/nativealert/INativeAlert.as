package uk.co.betadesigns.extension.nativealert
{

    public interface INativeAlert
    {
        /**
         *
         * @param title Title to be displayed in the Alert.
         * @param message Message to be displayed in the Alert.
         * @param closeLabel Label for the close button.
         * @param otherLabels shoud be a comma separated sting of button labels.
         * for example "one,two,three"
         *
         */
        function showAlertWithTitleAndMessage( title : String, message : String,
            closeLabel : String, otherLabels : String = "" ) : void;
    }
}
