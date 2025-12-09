# `alert_controller.js`

Este controlador de Stimulus se encarga de mostrar notificaciones al usuario utilizando la librería [toastr](https://github.com/CodeSeven/toastr). Permite la visualización de notificaciones a través de eventos personalizados o directamente desde elementos del DOM.

## Dependencias

-   `@hotwired/stimulus`: Framework JavaScript para conectar el HTML con el JavaScript.
-   `toastr`: Librería JavaScript para notificaciones tipo "toast".

## Funcionalidades

### `connect()`

Este método del ciclo de vida de Stimulus se invoca automáticamente cuando el controlador se conecta a un elemento del DOM. Su función principal es configurar un "event listener" global.

-   **Evento escuchado:** `notification:show`
-   **Acción:** Cuando se dispara este evento, se invoca el método `showNotificationFromEvent` del controlador.
-   **Contexto:** El `event listener` se enlaza al contexto del controlador (`this`) para asegurar que `this` dentro de `showNotificationFromEvent` se refiera a la instancia del controlador.

### `showNotificationFromEvent(event)`

Este método maneja las notificaciones que se disparan a través del evento `notification:show`.

-   **Parámetros:**
    -   `event`: El objeto de evento personalizado. Se espera que `event.detail` contenga las propiedades `message` (el texto de la notificación) y `type` (el tipo de notificación, por ejemplo, `success`, `error`, `info`, `warning`, que coinciden con los métodos de `toastr`).
-   **Acción:** Llama al método `toastr[type](message)` para mostrar la notificación. Por ejemplo, si `type` es `'success'`, se ejecutará `toastr.success(message)`.

### `showNotification(event)`

Este método está diseñado para ser invocado directamente por una acción de Stimulus desde un elemento del DOM.

-   **Parámetros:**
    -   `event`: El objeto de evento del DOM que activó la acción.
-   **Acción:**
    1.  Extrae el mensaje de la notificación del atributo `data-alert-message` del elemento que originó el evento (`event.currentTarget`).
    2.  Muestra la notificación utilizando `toastr.success(message)`, asumiendo que este método siempre muestra notificaciones de éxito.

## Ejemplo de uso

### Disparar una notificación a través de un evento (desde cualquier parte de la aplicación):

```javascript
window.dispatchEvent(new CustomEvent('notification:show', {
    detail: {
        message: '¡Operación completada con éxito!',
        type: 'success'
    }
}));
```

### Disparar una notificación desde un elemento del DOM (usando una acción de Stimulus):

```html
<button data-controller="alert" data-action="click->alert#showNotification" data-alert-message="¡Este es un mensaje de alerta de éxito!">
    Mostrar Alerta
</button>
```
