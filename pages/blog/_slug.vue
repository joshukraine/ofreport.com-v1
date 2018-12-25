<template lang="pug">
.container(v-editable="story.content" class="blog")
  .text-center.my-10(class="md:my-16")
    h1 {{ story.content.title }}
    p.text-grey-dark.text-sm {{ story.content.author }} &middot; {{ pubDate }}

    div(v-if="story.tag_list.length > 0")
      span.inline-block.bg-grey-lighter.rounded-full.px-3.py-1.text-xs.font-semibold.text-grey-darker.mr-2.mb-2(
        v-for="(tag, index) in story.tag_list"
        :key="index"
        class="sm:text-sm md:mb-0")
        nuxt-link(to="#") &#35;{{ tag }}

  .text-center.mb-16
    a(:href="story.content.cover_image_lg")
      img.rounded-lg(
        class="md:rounded-xl lg:mb-2"
        :src="story.content.cover_image"
        :alt="story.content.caption")
    p.font-bold(class="md:mx-8") {{ story.content.caption }}

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
