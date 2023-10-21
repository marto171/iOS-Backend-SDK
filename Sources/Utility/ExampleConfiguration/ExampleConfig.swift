//
//  ExampleConfig.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation

public final class ExampleConfig: Config {
    public var baseUrl: String = "dw"
    public var language: CustomLanguage = .bg
    public var errors: LocalizedErrors = ExampleLocalizedErrors(
        bg: [
            ExampleError(type: .APIConnectionError, message: "Грешка при свързване с API!"),
            ExampleError(type: .FetchUserFromDbFail, message: "Не може да намерим потребителя."),
            ExampleError(type: .UpdatePasswordFail, message: "Потребителя не може да бъде обновен."),
            ExampleError(type: .ServerConnectionError, message: "Опа! Изглежда, че имаме проблеми със свързването със сървъра. Моля, опитайте отново по-късно."),
            ExampleError(type: .UpdatePasswordFail, message: "Не можахме да актуализираме паролата ви в момента. Моля, опитайте отново."),
            ExampleError(type: .EmailResendFail, message: "Съжаляваме, но имаше проблем с изпращането на имейла. Моля, проверете интернет връзката си и опитайте отново."),
            ExampleError(type: .ConfirmEmailResendFail, message: "За съжаление, не успяхме да ви изпратим нов имейл за потвърждение. Моля, свържете се с нашия екип за поддръжка за съдействие."),
            ExampleError(type: .RestorePasswordFail, message: "Ух-ох! Този път възстановяването на паролата не е сработила. Моля, опитайте да го направите още веднъж."),
            ExampleError(type: .NoActiveUser, message: "Изглежда, че профилът ви вече не е активен. Моля, влезте отново, за да продължите."),
            ExampleError(type: .DataRefreshError, message: "Опа! Нещо се обърка при обновяването на данните ви. Моля, опитайте отново по-късно."),
            ExampleError(type: .SaveProfileSettingsFail, message: "Срещнахме проблем, докато запазвахме настройките на профила ви. Моля, опитайте отново или се свържете с нашия екип за поддръжка за помощ."),
            ExampleError(type: .FinishSetupError, message: "Срещнахме проблем, докато запазвахме настройките ви. Моля, опитайте отново или се свържете с нашия екип за поддръжка за помощ."),
            ExampleError(type: .NoUserDetails, message: "Не успяхме да намерим никакви подробности за вашия профил. Моля, влезте отново, за да извършите настройката на профила."),
            ExampleError(type: .SearchError, message: "Не успяхме да намерим никакви резултати в този момент. Моля, помислете за прецизиране на търсенето си и опитайте отново.")
        ],
        en: [
            ExampleError(type: .APIConnectionError, message: "Error connecting to API!"),
            ExampleError(type: .FetchUserFromDbFail, message: "Could not fetch user from API."),
            ExampleError(type: .UpdatePasswordFail, message: "User password could not be updated"),
            ExampleError(type: .ServerConnectionError, message: "Oops! It looks like we're having trouble connecting to the server. Please try again later."),
            ExampleError(type: .UpdatePasswordFail, message: "We couldn't update your password at the moment. Please give it another shot."),
            ExampleError(type: .EmailResendFail, message: "Sorry, there was an issue sending the email. Please check your internet connection and try again."),
            ExampleError(type: .ConfirmEmailResendFail, message: "Saddly, we were unable to send you a new confirmation email. Please contact our support team for assistance."),
            ExampleError(type: .RestorePasswordFail, message: "Uh-oh! Password reset didn't work this time. Please attempt it once more."),
            ExampleError(type: .NoActiveUser, message: "Looks like your profile isn't active anymore. Please log in again to continue."),
            ExampleError(type: .DataRefreshError, message: "Oops! Something went wrong while refreshing your data. Please try again later."),
            ExampleError(type: .SaveProfileSettingsFail, message: "We encountered a problem while saving your profile settings. Please try again or contact our support team for help."),
            ExampleError(type: .FinishSetupError, message: "We encountered a problem while saving your preferences. Please try again or contact our support team for help."),
            ExampleError(type: .NoUserDetails, message: "We couldn't find any details about your profile. Please log in again to perform account setup."),
            ExampleError(type: .SearchError, message: "We couldn't find any results at this time. Please consider refining your search and try again.")
        ],
        de: [
            ExampleError(type: .APIConnectionError, message: "Error connecting to API!"),
            ExampleError(type: .FetchUserFromDbFail, message: "Could not fetch user from API."),
            ExampleError(type: .UpdatePasswordFail, message: "Benutzerpasswort konnte nicht aktualisiert werden"),
            ExampleError(type: .ServerConnectionError, message: "Oops! Es sieht so aus, als ob wir Probleme mit der Verbindung zum Server haben. Bitte versuchen Sie es später noch einmal."),
            ExampleError(type: .UpdatePasswordFail, message: "Wir konnten Ihr Passwort im Moment nicht aktualisieren. Bitte versuchen Sie es noch einmal."),
            ExampleError(type: .EmailResendFail, message: "Sorry, es gab ein Problem beim Senden der E-Mail. Bitte überprüfen Sie Ihre Internetverbindung und versuchen Sie es noch einmal."),
            ExampleError(type: .ConfirmEmailResendFail, message: "Leider war es uns nicht möglich, Ihnen eine neue Bestätigungs-E-Mail zu senden. Bitte kontaktieren Sie unser Support-Team für Hilfe."),
            ExampleError(type: .RestorePasswordFail, message: "Oh-oh! Das Zurücksetzen des Passworts hat dieses Mal nicht funktioniert. Bitte versuchen Sie es noch einmal."),
            ExampleError(type: .NoActiveUser, message: "Sieht so aus, als ob Ihr Profil nicht mehr aktiv ist. Bitte melden Sie sich erneut an, um fortzufahren."),
            ExampleError(type: .DataRefreshError, message: "Oops! Beim Aktualisieren Ihrer Daten ist ein Fehler aufgetreten. Bitte versuchen Sie es später noch einmal."),
            ExampleError(type: .SaveProfileSettingsFail, message: "Beim Speichern Ihrer Profileinstellungen ist ein Problem aufgetreten. Bitte versuchen Sie es erneut oder wenden Sie sich an unser Support-Team."),
            ExampleError(type: .FinishSetupError, message: "Beim Speichern Ihrer Einstellungen ist ein Problem aufgetreten. Bitte versuchen Sie es erneut oder wenden Sie sich an unser Support-Team."),
            ExampleError(type: .NoUserDetails, message: "Wir konnten keine Details zu Ihrem Profil finden. Bitte melden Sie sich erneut an, um die Kontoeinrichtung durchzuführen."),
            ExampleError(type: .SearchError, message: "Zu diesem Zeitpunkt konnten wir keine Ergebnisse finden. Bitte verfeinern Sie Ihre Suche und versuchen Sie es erneut.")
        ]
    )
}

