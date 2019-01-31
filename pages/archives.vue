<template lang="pug">
.container(v-editable="story.content")
  h1.text-center {{ story.content.title }}

  component(
    v-if="story.content.component"
    :key="story.content._uid"
    :blok="story.content"
    :is="story.content.component")
</template>

<script>
import storyblokLivePreview from '@/mixins/storyblokLivePreview'

export default {
  mixins: [
    storyblokLivePreview
  ],
  data () {
    return {
      story: {
        content: {
          title: ''
        }
      }
    }
  },
  asyncData (context) {
    let version = context.query._storyblok || context.isDev ? 'draft' : 'published'
    let endpoint = 'cdn/stories/archives'

    return context.app.$storyapi.get(endpoint, {
      version: version
    }).then((res) => {
      console.log(res.data)
      return res.data
    }).catch((res) => {
      context.error({ statusCode: res.response.status, message: res.response.data })
    })
  }
}
</script>
