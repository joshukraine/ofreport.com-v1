<template lang="pug">
.container(v-editable="story.content" class="blog")
  .text-center.my-16
    h1 {{ story.content.title }}
    p.text-grey-dark.text-sm {{ story.content.author }} &middot; {{ pubDate }}
  .text-center.mb-16
    a(:href="story.content.cover_image_lg")
      img.rounded-xl(:src="story.content.cover_image" :alt="story.content.caption")
    p.font-bold.mx-8 {{ story.content.caption }}

  component(
    :key="segment._uid"
    v-for="segment in story.content.segments"
    :segment="segment"
    :is="segment.component")
</template>

<script>
import storyblokLivePreview from '@/mixins/storyblokLivePreview'
import dateFormat from 'dateformat'

export default {
  mixins: [
    storyblokLivePreview
  ],
  data () {
    return {
      story: {
        content: {
          title: '',
          author: '',
          excerpt: '',
          cover_image: '',
          caption: '',
          segments: []
        }
      }
    }
  },
  computed: {
    pubDate () {
      return dateFormat(this.story.first_published_at, 'mediumDate')
    }
  },
  asyncData (context) {
    let version = context.query._storyblok || context.isDev ? 'draft' : 'published'
    let endpoint = `cdn/stories/blog/${context.params.slug}`

    return context.app.$storyapi.get(endpoint, {
      version: version
    }).then((res) => {
      return res.data
    }).catch((res) => {
      context.error({ statusCode: res.response.status, message: res.response.data })
    })
  }
}
</script>
