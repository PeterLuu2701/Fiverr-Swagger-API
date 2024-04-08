import { ApiProperty } from "@nestjs/swagger"

export class CreateJobTypeDetailDto {
    @ApiProperty()
    job_type_detail_name: string

    @ApiProperty()
    image: string

    @ApiProperty()
    job_type_id: number
}