class ReactionReflex < ApplicationReflex

    def like
        reply = Reply.find(element.dataset[:id])
        reply.increment! :like
        cable_ready["reaction"].text_content(
            selector: "reply-#{reply.id}-likes",
            text: reply.like
        ).broadcast
        
    end

    def love
        reply = Reply.find(element.dataset[:id])
        reply.increment! :love
        cable_ready["reaction"].text_content(
            selector: "reply-#{reply.id}-loves",
            text: reply.love
        )
        cable_ready.broadcast
    end

    def dislike
        reply = Reply.find(element.dataset[:id])
        reply.increment! :dislike
        cable_ready["reaction"].text_content(
            selector: "reply-#{reply.id}-dislikes",
            text: reply.dislike
        )
        cable_ready.broadcast
    end

    def exclamation
        reply = Reply.find(element.dataset[:id])
        reply.increment! :exclamation
        cable_ready["reaction"].text_content(
            selector: "reply-#{reply.id}-exclamations",
            text: reply.exclamation
        )
        cable_ready.broadcast
    end
  end
