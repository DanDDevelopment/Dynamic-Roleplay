let [chatMode, isAdmin] = [0, false]
let filtered = null
let closeTimeout = null
let visibilityTimeout = null
let mouseActive = false
let messages = []
let suggestions = []
let [lastInputs, lastInputIndex, onlyCommand] = [[], -1, false]
const Emojies = ["👋", "🤚", "🖐", "✋", "🖖", "👌", "🤏"]
const chatModes = ["on_input", "visible", "closed"]
const templates = {
    "message": (msg) => {
        return `
        <div class="gfxchat-message">
            <div class="message-header"><div class="member-message-id"><p>${msg.src}</p></div></div>
            <div class="message-content"><p ><span ${!msg.admin ? `style="color: ${msg.color}"` : `style="${msg.admin ? "animation-name: backgroundColorPalette;animation-duration: 3s;animation-iteration-count: infinite;animation-direction: alternate;animation-timing-function: linear;" : ""}"`}>${msg.name}</span>: ${ " " + msg.message}</p></div>
            ${isAdmin && mouseActive ? `<div class="admin-buttons"><button name="mute" data-id=${msg.src}><p>MUTE</p></button><button data-id=${msg.src} name="kick"><p>KICK</p></button></div>` : ""}
        </div>
        `
    },
    "notify": (msg) => {
        return `
            <div class="gfxchat-message warn">
                <div class="message-header"><img src="./img/emojione_exclamation-question-mark" alt=""></div>
                <div class="message-content"><p>${msg.message}</p></div>
            </div>
        `
    },
    "alert": (msg) => {
        return `
            <div class="gfxchat-message warn">
                <div class="message-header"><img src="./img/ic_baseline-announcement.png" alt=""></div>
                <div class="message-content"><p>${msg.message}</p></div>
            </div>
        `
    },
}

$(document).on("ready", function(){
    $(".gfxchat-messages-input").css("display", "none")
})

const forbidden = ["<div", "<img", "</", "<span", "<p", "<label", "<script"]

window.addEventListener("message", function(e) {
    let data = e.data
    switch (data.type) {
        case "display":
            Display(data.bool, data.bool)
            isAdmin = data.isAdmin != "user"
            break;
        case "chatMode":
            clearTimeout(visibilityTimeout)
            visibilityTimeout = null
            chatMode = chatModes[chatMode + 1] ? (chatMode + 1) : 0
            let mode = GetChatMode()
            Visibility(mode)
            if(mode=="closed"){
                let inputActive = $(".gfxchat-messages-input").css("display")
                if(inputActive == "none") return
                Display(false)
            } else if (mode == "visible") {
                Display(true, false)
            }
            break;
        case "add_message":
            let isHtml = false
            for (let i = 0; i < forbidden.length; i++) {
                const element = forbidden[i];
                if(data.msg.message.includes(element)){
                    isHtml = true
                    break;
                }
            }
            if(isHtml)return
            messages.push(data.msg)
            if(messages.length>20){
                messages.shift()
                $(".gfxchat-messages-contain > .gfxchat-message").eq(0).remove()
            }
            AppendMessage(data.msg)
            if (GetChatMode() != "closed" || data.msg.type != "message") {
                let inputActive = $(".gfxchat-messages-input").css("display")
                if(inputActive != "none") return
                Display(true, false)
                CloseChatWithDelay()
            }
            break;
        case "suggestions":
            suggestions = data.suggestions
            break;
        case "clear":
            messages = []
            LoadChatMessages();
            break;
    
    }
})

Visibility = (mode) => {
    $("body").fadeIn(250)
    $(".chat-visibility").html(mode.replace("_", " ").toUpperCase())
    $(".chat-visibility").fadeIn(250)
    if (visibilityTimeout == null) {
        visibilityTimeout = setTimeout(() => {
            $(".chat-visibility").fadeOut(250)
            if(mode!="visible"){
                $("body").fadeOut(250)
            }
        }, 1000);    
    }
}

ClearCloseTimeout = ()=>{
    if(closeTimeout!=null){
        clearTimeout(closeTimeout)
        closeTimeout = null
    }
}

CloseChatWithDelay = ()=> {
    ClearCloseTimeout()
    if (closeTimeout == null) {
        closeTimeout = setTimeout(() => {
            let inputActive = $(".gfxchat-messages-input").css("display")
            if(inputActive=="none"){
                Display(false, false, true)
            }
        }, 2500);    
    }
}

AppendMessage = (msg) => {
    if(msg){
        let content = templates[msg.type](msg)
        $(".gfxchat-messages-contain").append(content);    
    }
}

LoadChatMessages = ()=>{
    $(".gfxchat-messages-contain").find(".gfxchat-message").remove()
    for (let i = 0; i < messages.length; i++) {
        const element = messages[i];
        AppendMessage(element)
    }
}

GetChatMode = ()=> {
    return chatModes[chatMode]
}

Display = (bool, input, fade, forceClose) => {
    if(bool){
        $(".text-info").html("")
        $("body").show()
        LoadChatMessages()
        $(".gfxchat-messages-input").css("display", "flex")
        if(input){
            OpenInput()
        } else {
            CloseInput()
        }
    } else {
        let inputActive = $(".gfxchat-messages-input").css("display") != "none"
        if (inputActive && !forceClose) return
        if (GetChatMode() != "visible") {
            if(!fade){
                $("body").hide()

            } else {
                $("body").fadeOut(250)
            }
        }
        $(".emoji-contain").hide()
        $(".times-popup").hide()
        mouseActive = false
        filtered = null
        CloseInput()
    }
}

CloseInput = (onlyMouse) => {
    if(onlyMouse){
        mouseActive = false
        $.post("https://gfx-chat/getMouse");
        return
    }
    $("#message-input").val("")
    $(".gfxchat-messages-input").hide()
    $.post("https://gfx-chat/closeInput");
}

OpenInput = (onlyMouse) => {
    if(onlyMouse){
        mouseActive = true
        $.post("https://gfx-chat/getMouse");
        return
    }
    $(".gfxchat-messages-input").show()
    $("#message-input").focus()
}

SendMessageInput = ()=>{
    let text = $("#message-input").val()
    if (text.replace(/^\s+|\s+$/g, '').length == 0 || text.trim().length == 0 || text.replace(/^\s+/, '').replace(/\s+$/, '') == "") return Display(false, null, null, true)
    CloseInput()
    if(GetChatMode()!="visible"){
        CloseChatWithDelay()
    }
    if (!onlyCommand || onlyCommand && text.charAt(0) == "/") {
        lastInputs.unshift(text)
    }
    $(".emoji-contain").hide()
    $(".admin-buttons").remove()
    if (mouseActive) {mouseActive = !mouseActive}
    $.post("https://gfx-chat/chatResult", JSON.stringify({message: text}));
    $("#message-input").val("")
}

$(document).on("input", "#message-input", function(e) { 
    let message = $(this).val()
    if(message.length==0){
        $(".text-info").html("")
        filtered = null
    }
})

$(document).on("keyup", "#message-input", function(e) {
    let message = $(this).val()
    if (message.charAt(0)=="/"){
        filtered = suggestions.filter((e)=>{
            return e.name.match(message)
        })
        if(filtered[0]){
            $(".text-info").html(filtered[0].name)
        } else {
            $(".text-info").html("")
        }
    }
    switch (e.which) {
        case 13:
            SendMessageInput()
            break;
    }
})

$(document).on("keyup", function(e){
    switch (e.which) {
        case 112:
            mouseActive = !mouseActive
            $.post("https://gfx-chat/getMouse");
            if(isAdmin){
                LoadChatMessages()
            }
            if(!mouseActive){
                $(".emoji-contain").css("display", "none")
                $(".times-popup").hide()
                $("#message-input").focus()
            }
            break;
        case 27:
            Display(false, null, null, true)
            break;
        case 9:
            if(filtered && filtered[0]){
                $("#message-input").val(filtered[0].name)
            }
            setTimeout(() => {
                $("#message-input").focus()
            }, 250);
            break;
        case 38:
            ArrowUp()
            break;
        case 40:
            ArrowDown()
            break;
        
    }
})

SetLastInput = ()=>{
    $("#message-input").val(lastInputs[lastInputIndex])
}

ArrowUp = ()=>{
    lastInputIndex = lastInputs[lastInputIndex + 1] ? lastInputIndex + 1 : lastInputIndex
    SetLastInput()
}

ArrowDown = ()=>{
    if(lastInputIndex - 1 == -1) {
        $("#message-input").val("")
    } else {
        lastInputIndex = lastInputs[lastInputIndex - 1] ? lastInputIndex - 1 : lastInputIndex
        SetLastInput()
    
    }

}

$(document).on("click", ".emoji", function(){
    let isOpened = $(".emoji-contain").css("display") == "flex"
    if (!isOpened) {
        $(".emoji-contain").css("display", "flex")
    } else {
        $(".emoji-contain").css("display", "none")
    }
})

$(document).on("click", ".emoji", function(){
    let isOpened = $(".emoji-contain").css("display") == "flex"
    if (!isOpened) {
        $(".emoji-contain").css("display", "flex")
    } else {
        $(".emoji-contain").css("display", "none")
    }
})

$(document).on("click", ".message-send", function(){
    SendMessageInput()
})

$(document).on("click", ".emoji", function() { 
    let emojiesOpened = $(".emoji-contain").css("display") == "flex"
    emojiesOpened ? $(".emoji-contain").hide() : $(".emoji-contain").css("display", "flex")
})

$(document).on("click", ".emojies > span", function() { 
    let emoji = $(this).html()
    let message = $("#message-input").val()
    $("#message-input").val(message + " " + emoji)
})

let muteId = 0
$(document).on("dblclick", ".admin-buttons > button", function() {
    let type = $(this).attr("name")
    let id = $(this).data("id")
    if(type=="kick"){
        $.post("https://gfx-chat/adminAction", JSON.stringify({type, id}));
        return
    }
    muteId = id
    $(".times-popup").css("display", "flex")
})

$(document).on("click", ".times-popup > .time", function() {
    let time = $(this).attr("name")
    $.post("https://gfx-chat/adminAction", JSON.stringify({type: "mute", muteId, time}));
    $(this).parent().hide()
})

$(document).on("click", "body", function(){
    setTimeout(() => {
        $("#message-input").focus()
    }, 250);
})

$(document).on("contextmenu", "body", function(){
    setTimeout(() => {
        $("#message-input").focus()
    }, 250);
})

// SetEmojies = () => {
//     for (let i = 0; i < Emojies.length; i++) {
//         const element = Emojies[i];
//         console.log(JSON.stringify(Emojies))
//         let content = `<span>${element}</span>`
//         console.log(content)
//         $(".emoji-contain > .emojies").append(content);
//     }
// }

// SetEmojies()