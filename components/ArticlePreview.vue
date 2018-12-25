<template lang="pug">
article.max-w-md.mx-auto.group.shadow-md.rounded.overflow-hidden.bg-white.mb-12
  nuxt-link(:to="'/blog/' + slug")
    img.opacity-90.z-1(class="group-hover:opacity-100" v-if="thumbnail" :src="thumbnail")
  .px-6.pt-2.pb-4
    nuxt-link(:to="'/blog/' + slug")
      h2.text-black.mb-0(class="hover:text-ofr-blue") {{ title }}
    p.text-grey-dark.text-sm {{ author }} &middot; {{ pubDate }}
    p.text-grey-darkest.mb-0 {{ excerpt }}
  div.px-6.py-4(v-if="tags.length > 0")
    span.inline-block.bg-grey-lighter.rounded-full.px-3.py-1.text-sm.font-semibold.text-grey-darker.mr-2(
      v-for="(tag, index) in tags" :key="index")
      nuxt-link(to="#") &#35;{{ tag }}
</template>

<script>
export default {
  props: {
    slug: {
      type: String,
      required: true
    },
    thumbnail: {
      type: String,
      required: true
    },
    title: {
      type: String,
      required: true
    },
    author: {
      type: String,
      required: true
    },
    pubDate: {
      type: String,
      required: true
    },
    excerpt: {
      type: String,
      required: true
    },
    tags: {
      type: Array
    }
  }
}
</script>
